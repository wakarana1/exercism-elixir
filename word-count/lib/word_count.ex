defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^\p{L}\p{Nd}\p{Pd}]/u, trim: true)
    |> Enum.reduce(Map.new(), fn word, map ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
