defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(""), do: true

  def check_brackets(str) do
    has_matching_brackets(str, "", false)
  end

  defp has_matching_brackets("", _, has_matches), do: has_matches

  defp has_matching_brackets("(" <> rest, acc, has_matches),
    do: has_matching_brackets(rest, "(" <> acc, has_matches)

  defp has_matching_brackets("[" <> rest, acc, has_matches),
    do: has_matching_brackets(rest, "[" <> acc, has_matches)

  defp has_matching_brackets("{" <> rest, acc, has_matches),
    do: has_matching_brackets(rest, "{" <> acc, has_matches)

  defp has_matching_brackets(")" <> rest, acc, _) do
    if String.starts_with?(acc, "(") do
      has_matching_brackets(rest, String.slice(acc, 1..-1), true)
    else
      has_matching_brackets("", acc, false)
    end
  end

  defp has_matching_brackets("]" <> rest, acc, _) do
    if String.starts_with?(acc, "[") do
      has_matching_brackets(rest, String.slice(acc, 1..-1), true)
    else
      has_matching_brackets("", acc, false)
    end
  end

  defp has_matching_brackets("}" <> rest, acc, _) do
    if String.starts_with?(acc, "{") do
      has_matching_brackets(rest, String.slice(acc, 1..-1), true)
    else
      has_matching_brackets("", acc, false)
    end
  end

  defp has_matching_brackets(<<char::utf8, rest::binary>>, acc, has_matches),
    do: has_matching_brackets(rest, acc, has_matches)
end
