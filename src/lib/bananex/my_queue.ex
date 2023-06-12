defmodule Bananex.MyQueue do
  use GenServer

  # Server
  def init(state), do: {:ok, state}

  def handle_call(:dequeue, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  # Client
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  # Funçao para desenfilerar nossa fila
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
end
