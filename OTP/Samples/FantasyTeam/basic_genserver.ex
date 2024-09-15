defmodule FantasyTeam.BasicGenServer do
  use GenServer

  # API

  def start do
    GenServer.start(__MODULE__, :ok, [])
  end

  def add(pid, name) do
    GenServer.cast(pid, {:add, name})
  end

  def remove(pid, name) do
    GenServer.cast(pid, {:remove, name})
  end

  def team(pid) do
    GenServer.call(pid, :team)
  end

  # Callbacks
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:add, name}, state) do
    player = FantasyTeam.Player.find(name)
    new_state = Map.put(state, name, player)
    {:noreply, new_state}
  end

  def handle_cast({:remove, name}, state) do
    new_state = Map.delete(state, name)
    {:noreply, new_state}
  end

  def handle_call({:team, _from}, state) do
    # state to return & state stored
    {:reply, state, state}
  end
end
