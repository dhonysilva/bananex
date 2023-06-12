defmodule Bananex.Fruits.InsertSingle2 do
  alias Bananex.Fruits.Fruit
  alias Bananex.Repo

  def call() do
    :timer.tc(fn -> do_call() end)
  end

  defp do_call() do
    number_of_fruits = 1..983_025

    number_of_fruits
    |> Stream.map(fn x -> %{name: "fruit #{x}"} end)
    |> Stream.chunk_every(65535)
    |> Enum.each(fn chunck -> Repo.insert_all(Fruit, chunck) end)

    # Enum.each(1..15, fn _ ->
    #   number_of_fruits = 1..65535

    #   records =
    #     Enum.map(number_of_fruits, fn x ->
    #       %{name: "fruit #{x}"}
    #     end)

    #   Repo.insert_all(Fruit, records)
    # end)
  end
end
