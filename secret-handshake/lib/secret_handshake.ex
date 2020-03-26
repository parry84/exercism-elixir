defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
      |> Integer.digits(2)
      |> Enum.reverse
      |> Enum.with_index
      |> Enum.filter(fn {k, _} -> k == 1 end)
      |> Enum.map(fn {_, v} -> v end)
      |> Enum.reduce([], fn x, acc -> protocol(x, acc) end)
  end

  defp protocol(x, acc) do
    case x do
      0 -> acc ++ ["wink"]
      1 -> acc ++ ["double blink"]
      2 -> acc ++ ["close your eyes"]
      3 -> acc ++ ["jump"]
      4 -> Enum.reverse(acc)
      _ -> acc
    end
  end
end
