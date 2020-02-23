defmodule HelloWorld do
  @doc """
  Simply returns "Hello, World!"
  """
  @spec hello :: String.t()
  def hello do
    Greetings.greet(self())

    receive do
      {:hello, message} -> message
      _ -> "How rude!"
    end
  end
end

defmodule Greetings do
  @spec greet(pid()) :: {:hello, String.t()}
  def greet(who) do
    send(who, {:hello, "Hello, World!"})
  end
end
