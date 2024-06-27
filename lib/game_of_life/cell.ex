defmodule GameOfLife.Cell do
  defstruct [:contents]

  def new(_x, _y, opts) do
    %__MODULE__{contents: Keyword.get(opts, :contents)}
  end

  def get(%__MODULE__{contents: contents}) do
    contents
  end
end
