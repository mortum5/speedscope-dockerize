#!/bin/sh

set +x
pid="0"

handle_signal() {
  kill -SIGTERM "${sub_pid}"
  wait

  exit 0
}

trap 'handle_signal' SIGINT SIGTERM SIGHUP SIGUSR1 SIGUSR2

"$@" &
pid="${!}"
sleep 1
sub_pid="$(ps -eo pid,ppid | awk -v ppid_var="$pid" '$2 == ppid_var {print $1}')"
wait "${pid}"