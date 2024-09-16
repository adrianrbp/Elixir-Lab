defmodule FantasyTeam.BasicSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(FantasyTeam.SingleServer, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
