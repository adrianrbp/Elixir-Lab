## basics.erl
```bash
# Compile outside
erlc basics.erl
## Generates: basics.beam


# Compile inside
erl
compile:file("basics.erl").
## Generates: basics.beam

# Run inside
erl
cd("erlang/basics").
c(basics).

basics:add(7,2).
basics:hello().

basics:module_info().
[{module,basics},
 {exports,[{add,2},
           {hello,0},
           {greet_and_add_two,1},
           {module_info,0},
           {module_info,1}]},
 {attributes,[{vsn,[238109181561989046455121787579998561199]}]},
 {compile,[{version,"8.2.3"},
           {options,[]},
           {source,"/workspaces/elixir-lab/erlang/basics/basics.erl"}]},
 {md5,<<179,34,41,8,34,130,46,179,167,119,50,69,204,90,
        99,175>>}]

basics:module_info(attributes).
#[{vsn,[238109181561989046455121787579998561199]}]


# Outside: use some flags
erlc \
  -debug_info \
  -{outdir,Dir} \
  -export_all \
  -{d,Macro} \
  basics.erl

# Inside: use some flags
erl
compile:file(basics, [debug_info, export_all]).
c(basics, [debug_info, export_all]).
```


## functions.erl
```bash
c(functions).

functions:greet(other,"mark").
# Hello, mark!ok

functions:greet(male,"mark").     
# Hello, Mr. mark!ok

functions:greet(female,"mark").
# Hello, Mrs. mark!ok

functions:head([1,2,3,4]).
# 1
functions:second([1,2,3,4]).
# 2


functions:valid_time({{2011,09,06},{09,04,43}}).
# The Date tuple ({2011,9,6}) says today is: 2011/9/6,
# The time tuple ({9,4,43}) indicates: 9:4:43.
# ok

functions:valid_time({{2011,09,06},{09,04}}).
# Stop feeding me wrong data!
# ok

functions:oh_god(2).
# might_succeed
functions:oh_god(3).
# always_does
```