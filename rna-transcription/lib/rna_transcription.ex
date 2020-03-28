defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @rna_mapping %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &@rna_mapping[&1])
  end
end
