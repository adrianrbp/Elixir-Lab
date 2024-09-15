defmodule FantasyTeam.Player do
  # Find a player by name and return their info
  def find("Russell Wilson") do
    %{
      active: "1",
      college: "Wisconsin",
      display_name: "Russell Wilson",
      dob: "1988-11-29",
      fname: "Russell",
      height: "5-11",
      jersey: "3",
      lname: "Wilson",
      player_id: "1847",
      position: "QB",
      team: "SEA",
      weight: "206"
    }
  end

  def find("Doug Baldwin") do
    %{
      active: "1",
      college: "Stanford",
      display_name: "Doug Baldwin",
      dob: "1988-09-21",
      fname: "Doug",
      height: "5-10",
      jersey: "89",
      lname: "Baldwin",
      player_id: "5987",
      position: "WR",
      team: "SEA",
      weight: "189"
    }
  end

  # Add more players or return a default message for unknown names
  def find(_name) do
    %{
      error: "Player not found"
    }
  end
end
