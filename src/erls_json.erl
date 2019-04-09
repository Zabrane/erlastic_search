-module(erls_json).

-include("erlastic_search.hrl").

-export([encode/1,decode/1]).

%%--------------------------------------------------------------------
%% @doc
%% Encodes the user-supplied `Json' with the user's defined JSON
%% module (defaults to `jsx`)
%% In particular, this function cannot be used to encode any JSON
%% built internally to `erlastic_search` as we do not know how
%% the user's JSON module encodes JSONs in Erlang
%% @end
%%--------------------------------------------------------------------
-spec encode(erlastic_json()) -> binary().
encode(Json) ->
    jsone:encode(Json, [{float_format, [{decimals, 4}, compact]}]).

%%--------------------------------------------------------------------
%% @doc
%% Decodes the given `BinaryJson' with the user's defined JSON
%% module (defaults to `jsx`)
%% The same caveat as for `encode/1' above applies
%% @end
%%--------------------------------------------------------------------
-spec decode(binary()) -> erlastic_json().
decode(BinaryJson) ->
    jsone:decode(BinaryJson, [{object_format, proplist}, {allow_ctrl_chars, true}]).
