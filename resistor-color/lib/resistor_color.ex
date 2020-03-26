defmodule ResistorColor do
  @moduledoc false
  @color_code [
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  ]

  @spec code(String.t()) :: integer()
  def code(color) do
    Keyword.get(@color_code, String.to_existing_atom(color))
  end

  @spec colors() :: list(String.t())
  def colors do
    Keyword.keys(@color_code)
    |> Enum.map(&to_string/1)
  end
end
