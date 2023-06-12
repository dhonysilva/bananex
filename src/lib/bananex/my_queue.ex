defmodule Bananex.MyQueue do
  use GenServer

  # Server
  def init(state), do: {:ok, state}

  # Client
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
end
