#!/usr/bin/bash

record() {
  filename="$(date '+%a__%b%d__%H_%M_%S').mkv"
  output="$HOME/Videos/screencapture/$filename"
  
  wf-recorder -f "$output" > /dev/null 2>&1 &
  
  pid=$(pgrep -n wf-recorder)
  
  if [[ -n "$pid" ]]; then
    echo "$pid" > /tmp/recpid
    date +%s > /tmp/rectime
    notify-send -t 500 "Recording started: $filename."
  else
    notify-send "Failed to start recording."
  fi
}

end() {
  if [[ -f /tmp/recpid ]]; then
    pid=$(cat /tmp/recpid)

    kill -2 $pid 2>/dev/null
    rm -f /tmp/recpid /tmp/rectime
    notify-send "Recording ended."
  else
    notify-send "No recording in progress."
  fi
}

# toggles recording
if [[ -f /tmp/recpid ]]; then
  end
else
  record
fi

