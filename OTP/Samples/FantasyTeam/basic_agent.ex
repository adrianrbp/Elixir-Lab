defmodule FantasyTeam.BasicAgent do
  @name __MODULE__

  # def start do
  #   Agent.start(fn -> %{} end)
  # end

  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def add(name) do
    player = FantasyTeam.Player.find(name)
    # Agent.update(@name, fn state -> Map.put(state, name, player) end)
    # Agent.get_and_update(@name, fn state -> {state, Map.put(state, name, player)} end)
    Agent.cast(@name, fn state -> Map.put(state, name, player) end)
  end

  def remove(name) do
    # Agent.update(@name, fn state -> Map.delete(state, name) end)
    # Agent.get_and_update(@name, fn state -> {state, Map.delete(state, name)} end)
    Agent.cast(@name, fn state -> Map.delete(state, name) end)
  end

  def team do
    Agent.get(@name, fn state -> state end)
  end
end
