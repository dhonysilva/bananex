defmodule Bananex.Scheduler do
  use GenServer

  # Server
  def init(state), do: {:ok, state}

  def handle_info(msg, state) do
    IO.inspect("Reveice the message: #{msg}")
    {:noreply, state}
  end

  # Client
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
end
