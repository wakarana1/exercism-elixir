defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count('', _), do: 0

  def count(strand, nucleotide) do
    Enum.count(strand, fn charlist -> charlist == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(''), do: %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  def histogram(strand) do
    Enum.map(@nucleotides, fn nuc ->
      count = count(strand, nuc)
      {nuc, count}
    end)
    |> Enum.into(%{})
  end
end