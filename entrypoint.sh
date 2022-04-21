#!/bin/sh

exec honeycloudfront --writekey="${HONEYCOMB_API_KEY}" "$@"
