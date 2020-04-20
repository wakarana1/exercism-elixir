defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, &is_anagram?(String.downcase(base), String.downcase(&1)))
  end

  defp is_anagram?(base, candidate) do
    case is_different_word?(base, candidate) do
      true ->
        sorted_graphemes(base) == sorted_graphemes(candidate)

      false ->
        false
    end
  end

  defp is_different_word?(base, other_word) do
    base != other_word
  end

  defp sorted_graphemes(word) do
    word |> String.graphemes() |> Enum.sort()
  end
end
