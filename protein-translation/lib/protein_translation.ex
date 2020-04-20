defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna([]), do: {:error, "invalid RNA"}

  def of_rna(rna) do
    rna_list =
      rna
      |> Stream.unfold(&String.split_at(&1, 3))
      |> Enum.take_while(&(&1 != ""))

    case translate_codon(rna_list) do
      {:error, error} ->
        {:error, error}

      list ->
        {:ok, Enum.reverse(list)}
    end
  end

  defp translate_codon(rna_list) do
    Enum.reduce_while(rna_list, [], fn codon, acc ->
      case of_codon(codon) do
        {:ok, "STOP"} ->
          {:halt, acc}

        {:ok, translated_codon} ->
          {:cont, [translated_codon | acc]}

        {:error, _} ->
          {:halt, {:error, "invalid RNA"}}
      end
    end)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    codon_protein_map = %{
      "UGU" => "Cysteine",
      "UGC" => "Cysteine",
      "UUA" => "Leucine",
      "UUG" => "Leucine",
      "AUG" => "Methionine",
      "UUU" => "Phenylalanine",
      "UUC" => "Phenylalanine",
      "UCU" => "Serine",
      "UCC" => "Serine",
      "UCA" => "Serine",
      "UCG" => "Serine",
      "UGG" => "Tryptophan",
      "UAU" => "Tyrosine",
      "UAC" => "Tyrosine",
      "UAA" => "STOP",
      "UAG" => "STOP",
      "UGA" => "STOP"
    }

    if codon_protein_map[codon] do
      {:ok, codon_protein_map[codon]}
    else
      {:error, "invalid codon"}
    end
  end
end
