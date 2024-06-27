defmodule GameOfLife.Cell do
  use GenServer

  def new(x, y, opts) do
    {:ok, pid} =
      GenServer.start_link(__MODULE__, opts, name: {:via, Registry, {CellRegistry, {x, y}}})

    pid
  end

  def get(pid) do
    GenServer.call(pid, :contents)
  end

  def get(x, y) do
    [{pid, nil}] = Registry.lookup(CellRegistry, {x, y})
    GenServer.call(pid, :contents)
  end

  @impl GenServer
  def init(state) do
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:contents, _from, state) do
    {:reply, Keyword.get(state, :contents), state}
  end
end
