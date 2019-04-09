ErlasticSearch
======================================

This project it's using jsone as json parser. Also the parser cannot be changed as in the 
main repo.

An Erlang client for [Elasticsearch](https://www.elastic.co/products/elasticsearch).

Build and Run
-------------

Start a rebar3 shell

```shell
rebar3 shell
```

Create an index :

```erlang
erlastic_search:create_index(<<"index_name">>).
```
```
{ok, [{<<"ok">>,true},{<<"acknowledged">>,true}]}
```

Index a document :

```erlang
erlastic_search:index_doc(<<"index_name">>, <<"type">>, [{<<"key1">>, <<"value1">>}]).
```
```
{ok,[{<<"ok">>,true},
     {<<"_index">>,<<"index_name">>},
     {<<"_type">>,<<"type">>},
     {<<"_id">>,<<"T-EzM_yeTkOEHPL9cN5B2g">>},
     {<<"_version">>,1}]}
````

Index a document (providing a document id) :

```erlang
erlastic_search:index_doc_with_id(<<"index_name">>, <<"type">>, <<"id1">>, [{<<"key1">>, <<"value1">>}]).
```
```
{ok,[{<<"ok">>,true},
     {<<"_index">>,<<"index_name">>},
     {<<"_type">>,<<"type">>},
     {<<"_id">>,<<"id1">>},
     {<<"_version">>,2}]}
```

Search for a document :

```erlang
erlastic_search:search(<<"index_name">>, <<"type">>, <<"key1:value1">>).
```
```
{ok,[{<<"took">>,6},
     {<<"timed_out">>,false},
     {<<"_shards">>,
      [{<<"total">>,5},{<<"successful">>,5},{<<"failed">>,0}]},
     {<<"hits">>,
      [{<<"total">>,3},
       {<<"max_score">>,0.30685282},
       {<<"hits">>,
        [[{<<"_index">>,<<"index_name">>},
          {<<"_type">>,<<"type">>},
          {<<"_id">>,<<"T-EzM_yeTkOEHPL9cN5B2g">>},
          {<<"_score">>,0.30685282},
          {<<"_source">>,[{<<"key1">>,<<"value1">>}]}],
         [{<<"_index">>,<<"index_name">>},
          {<<"_type">>,<<"type">>},
          {<<"_id">>,<<"id1">>},
          {<<"_score">>,0.30685282},
          {<<"_source">>,[{<<"key1">>,<<"value1">>}]}],
         [{<<"_index">>,<<"index_name">>},
          {<<"_type">>,<<"type">>},
          {<<"_id">>,<<"MMNcfNHUQyeizDkniZD2bg">>},
          {<<"_score">>,0.30685282},
          {<<"_source">>,[{<<"key1">>,<<"value1">>}]}]]}]}]}
```

Testing
-------

In another terminal use docker-compose to start an Elasticsearch instance :

```bash
docker-compose up
```

For convenience, you can also start a Kibana instance for analysis/visualization :

```bash
docker-compose -f docker-compose.yml -f docker-compose-kibana.yml up
```

Run Common Test:

```bash
rebar3 ct
```
