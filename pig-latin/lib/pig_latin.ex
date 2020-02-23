defmodule PigLatin do
  @vowels ~w(a e i o u)

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Stream.map(&String.graphemes/1)
    |> Stream.map(&go(&1, []))
    |> Enum.join(" ")
  end

  defp go(word = [head | _], acc) when head in @vowels,
    do: "#{word}#{acc |> Enum.reverse()}ay"

  defp go(word = [head, second | _], []) when head in ~w(x y) and second not in @vowels,
    do: "#{word}ay"

  defp go(["q", "u" | tail], acc), do: go(tail, ["u", "q" | acc])

  defp go([head | tail], acc), do: go(tail, [head | acc])
end
