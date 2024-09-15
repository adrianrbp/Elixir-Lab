defmodule FantasyTeam.Basic do
  def start do
    spawn(__MODULE__, :loop, [%{}])
  end

  # def start_link do
  #   spawn_link(__MODULE__, :loop, [%{}])
  # end

  def loop(state) do
    receive do
      {:add, name} ->
        player = FantasyTeam.Player.find(name)
        new_state = Map.put(state, name, player)

        loop(new_state)

      {:remove, name} ->
        new_state = Map.delete(state, name)

        loop(new_state)

      {:tem, pid} ->
        send(pid, state)

        loop(state)
    end
  end
end
