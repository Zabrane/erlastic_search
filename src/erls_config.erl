%%%-------------------------------------------------------------------
%%% @author Brujo Benavides <>
%%% @copyright (C) 2010, 2012, Tristan Sloughter
%%% @doc
%%%
%%% @end
%%% Created : 29 Mar 2016 by Brujo Benavides <>
%%%-------------------------------------------------------------------
-module(erls_config).
-export([get_host/0, get_port/0, get_slow_query_threshold/0]).

%%--------------------------------------------------------------------
%% @doc
%% Retrieves the default host.
%% If nothing is defined in the app env for the key 'host', it's
%% 127.0.0.1
%% @end
%%--------------------------------------------------------------------
get_host() ->
    case application:get_env(erlastic_search, host) of
        undefined ->
            <<"127.0.0.1">>;
        {ok, Host}->
            Host
    end.

%%--------------------------------------------------------------------
%% @doc
%% Retrieves the default port.
%% If nothing is defined in the app env for the key 'port', it's 9200.
%% @end
%%--------------------------------------------------------------------
get_port() ->
    case application:get_env(erlastic_search, port) of
        undefined ->
            9200;
        {ok, Port}->
            Port
    end.

%%--------------------------------------------------------------------
%% @doc
%% Retrieves the default debug query flag.
%% If nothing is defined in the app env for the key 'slow_query_ms', it's false.
%% @end
%%--------------------------------------------------------------------

get_slow_query_threshold() ->
    case application:get_env(erlastic_search, slow_query_ms) of
        undefined ->
            false;
        {ok, Threshold}->
            Threshold
    end.
