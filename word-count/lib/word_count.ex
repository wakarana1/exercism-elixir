defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    string_to_word_list(sentence) |> word_counter()
  end

  @doc """
  Transforms string into a list of downcase words

  "Hi! how are you?" -> ["hi", "how", "are", "you"]
  """
  @spec string_to_word_list(String.t()) :: list(String.t())
  defp string_to_word_list(string) do
    string
    |> String.downcase()
    |> String.replace(~r/@|#|\$|%|&|\^|:|_|!|,/u, " ")
    |> String.split(" ", trim: true)
  end

  @doc """
  Counts how many times each word appears in a list.
  Returns a map where the key is the word and the value is the times it shows up.
  """
  @spec word_counter(List.t()) :: map
  def word_counter(word_list) do
    Enum.reduce(word_list, Map.new(), fn word, map ->
      Map.update(map, word, 1, &(&1 + 1))
    end)
  end
end
