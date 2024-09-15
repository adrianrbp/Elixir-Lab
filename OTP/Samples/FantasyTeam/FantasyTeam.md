## Data
```elixir
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
```
## Basic
```elixir
pid = FantasyTeam.Basic.start
send(pid, {:add, "Russell Wilson"})
send(pid, {:add, "Doug Baldwin"})
send(pid, {:remove, "Doug Baldwin"})

# Get the list of Team players
send(pid, {:team, self})

# Show mailbox
flush
```


## Basic Genserver & Single Server
```elixir
# alias FantasyTeam.SingleServer
# FantasyTeam.SingleServer.start
FantasyTeam.SingleServer.start_link
# {:ok, #PID<0.65.0>}
FantasyTeam.SingleServer.add("Russell Wilson")
# :ok
FantasyTeam.SingleServer.add("Doug Baldwin")
# :ok
FantasyTeam.SingleServer.remove("Doug Baldwin")
# :ok
FantasyTeam.SingleServer.team
# %{"Russell Wilson" => %{position: "QB", team: "SEA", ...}}

```
