defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @upper ?A..?Z
  @lower ?a..?z
  @alphabet_size 26

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> Kernel.to_charlist()
    |> Enum.map(&rotate_char(&1, shift))
    |> List.to_string()
  end

  @spec rotate_char(c :: binary, n :: integer) :: integer
  defp rotate_char(c, n) when c in @upper do
    rem(c - ?A + n, @alphabet_size) + ?A
  end

  defp rotate_char(c, n) when c in @lower do
    rem(c - ?a + n, @alphabet_size) + ?a
  end

  defp rotate_char(c, _), do: c
end
