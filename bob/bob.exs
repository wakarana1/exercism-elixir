defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"

      yelling_question?(input) ->
        "Calm down, I know what I'm doing!"

      shouting?(input) ->
        "Whoa, chill out!"

      question?(input) ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  def yelling_question?(string) do
    shouting?(string) && question?(string)
  end

  def question?(string) do
    String.ends_with?(string, "?")
  end

  def shouting?(string) do
    String.upcase(string) != String.downcase(string)
  end

  def silence?(string) do
    String.trim(string) == ""
  end
end
