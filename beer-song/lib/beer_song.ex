defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(number) do
    {n_bottle, one_less_n_bottle, one_or_it} =
      case number do
        2 ->
          {"2 bottles", "1 bottle", "one"}

        1 ->
          {"1 bottle", "no more bottles", "it"}

        n ->
          {"#{n} bottles", "#{n - 1} bottles", "one"}
      end

    """
    #{n_bottle} of beer on the wall, #{n_bottle} of beer.
    Take #{one_or_it} down and pass it around, #{one_less_n_bottle} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics() do
    lyrics(99..0)
  end

  def lyrics(range) do
    Enum.map(range, fn bottles ->
      verse(bottles)
    end)
    |> Enum.join("\n")
  end
end
