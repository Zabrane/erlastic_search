-module(erls_utils).

-export([
  now_ms/0
]).

now_ms() ->
  {Megasecs, Secs, Microsecs} = os:timestamp(),
  Megasecs * 1000000000 + Secs * 1000 + Microsecs div 1000.



