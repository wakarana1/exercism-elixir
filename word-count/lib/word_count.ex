defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    string_to_word_list(sentence) |> word_counter()
  end

  @spec string_to_word_list(String.t()) :: list(String.t())
  defp string_to_word_list(string) do
    string
    |> String.downcase()
    |> String.split(~r/[^\p{L}|\p{Nd}|\p{Pd}]/u, trim: true)
  end

  @spec word_counter(List.t()) :: map
  defp word_counter(word_list) do
    Enum.reduce(word_list, Map.new(), fn word, map ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
