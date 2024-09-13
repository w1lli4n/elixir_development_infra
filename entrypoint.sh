#!/bin/sh

mix deps.get

elixir --sname docker --cookie secret -S mix run --no-halt 
