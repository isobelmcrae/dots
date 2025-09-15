#!/usr/bin/env bash

if [[ -f /tmp/recpid && -f /tmp/rectime ]]; then
  start_time=$(< /tmp/rectime)
  now=$(date +%s)
  elapsed=$((now - start_time))
  printf -v duration '%02d:%02d:%02d' $((elapsed/3600)) $((elapsed/60%60)) $((elapsed%60))
  echo "  $duration"
else
  echo ''
fi

