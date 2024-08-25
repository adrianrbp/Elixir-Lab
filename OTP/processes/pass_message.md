- iex
```elixir
c("OTP/processes/pass_message.exs")
pid = spawn(PassMessage, :message, [])
## #PID<0.152.0>

Process.alive?(pid)
## true

Process.info(pid)
[
  current_function: {PassMessage, :message, 0},
  initial_call: {PassMessage, :message, 0},
  status: :waiting,
  message_queue_len: 0,
  links: [],
  dictionary: [],
  trap_exit: false,
  error_handler: :error_handler,
  priority: :normal,
  group_leader: #PID<0.67.0>,
  total_heap_size: 233,
  heap_size: 233,
  stack_size: 2,
  reductions: 5,
  garbage_collection: [
    max_heap_size: %{error_logger: true, kill: true, size: 0},
    min_bin_vheap_size: 46422,
    min_heap_size: 233,
    fullsweep_after: 65535,
    minor_gcs: 0
  ],
  suspending: []
]


# Send returns the message passed
# process pid (where to send a message), message to send
send(pid,"User")
## Hi, User
## "User"

# receive ended
Process.alive?(pid)
## false


c("OTP/processes/pass_message.exs")
pid = spawn(PassMessage, :message_back, [])
## #PID<0.167.0>
self()
## #PID<0.108.0>

send(pid, {self(), "User-2"})
## {#PID<0.108.0>, "User-2"}
receive do
 x -> x
end
## "Hi, User-2"

## :message_queue_len
process_info = Process.info(self())
Keyword.get(process_info, :message_queue_len)
## 0


Process.info(self())
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
         {16, #PID<0.108.0>},
         {15,
          [
            current_function: {PassMessage, :message, 0},
            initial_call: {PassMessage, :message, 0},
            status: :waiting,
            message_queue_len: 0,
            links: [],
            dictionary: [],
            trap_exit: false,
            error_handler: :error_handler,
            priority: :normal,
            group_leader: #PID<0.67.0>,
            total_heap_size: 233,
            heap_size: 233,
            stack_size: 2,
            reductions: 5,
            garbage_collection: [
              max_heap_size: %{error_logger: true, kill: true, size: 0},
              min_bin_vheap_size: 46422,
              min_heap_size: 233,
              fullsweep_after: 65535,
              minor_gcs: 0
            ],
            suspending: []
          ]},
         {14, true},
         {13, #PID<0.152.0>},
         {12, [PassMessage]},
         {11, [PassMessage]},
         {10,
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
          ]},
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
      size: 16,
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
  reductions: 468116,
  garbage_collection: [
    max_heap_size: %{error_logger: true, kill: true, size: 0},
    min_bin_vheap_size: 46422,
    min_heap_size: 233,
    fullsweep_after: 65535,
    minor_gcs: 47
  ],
  suspending: []
]
```