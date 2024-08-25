- iex
```elixir
c("OTP/processes/to_spawn.exs")

# Blocking:
ToSpawn.message("User")
## Hi, User
## :ok

# Non-blocking: spawn
# pass expression to eval on new process
# module, atom of func to execute, list of params as args:
pid = spawn(ToSpawn, :message, ["User"])
## Hi, User
## #PID<0.118.0>
i pid
## Term
##   #PID<0.120.0>
## Data type
##   PID
## Alive
##   false
## Description
##   Use Process.info/1 to get more info about this process
## Reference modules
##   Process, Node
## Implemented protocols
##   IEx.Info, Inspect
Process.alive?(pid)
## false

1..10 |> Enum.map(fn _ -> spawn(ToSpawn, :message, ["User"]) end)
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## Hi, User
## [#PID<0.124.0>, #PID<0.125.0>, #PID<0.126.0>, #PID<0.127.0>, #PID<0.128.0>,
##  #PID<0.129.0>, #PID<0.130.0>, #PID<0.131.0>, #PID<0.132.0>, #PID<0.133.0>]

# Get iex pid
self()
## #PID<0.108.0>


process.info(self())
[
  current_function: {Process, :info, 1},
  initial_call: {:proc_lib, :init_p, 5},
  status: :running,
  message_queue_len: 0,
  links: [],
  dictionary: [
    elixir_checker_info: {#PID<0.108.0>, nil},
    "$initial_call": {IEx.Evaluator, :init, 4},
    "$ancestors": [#PID<0.79.0>],
    iex_evaluator: #Reference<0.93174558.4121427972.220951>,
    iex_history: %IEx.History{
      queue: {[
         {9, #PID<0.108.0>},
         {8, nil},
         {7,
          [#PID<0.124.0>, #PID<0.125.0>, #PID<0.126.0>, #PID<0.127.0>,
           #PID<0.128.0>, #PID<0.129.0>, #PID<0.130.0>, #PID<0.131.0>,
           #PID<0.132.0>, #PID<0.133.0>]},
         {6, false},
         {5, :"do not show this result in output"},
         {4, #PID<0.120.0>},
         {3, #PID<0.118.0>},
         {2, :ok}
       ], [{1, [ToSpawn]}]},
      size: 9,
      start: 1
    },
    iex_server: #PID<0.79.0>
  ],
  trap_exit: false,
  error_handler: :error_handler,
  priority: :normal,
  group_leader: #PID<0.67.0>,
  total_heap_size: 86071,
  heap_size: 10958,
  stack_size: 59,
  reductions: 423776,
  garbage_collection: [
    max_heap_size: %{error_logger: true, kill: true, size: 0},
    min_bin_vheap_size: 46422,
    min_heap_size: 233,
    fullsweep_after: 65535,
    minor_gcs: 40
  ],
  suspending: []
]
```