#!/usr/bin/env bash

POMODORO_DURATION=1500  # 25 minutes = 1500 seconds
PIDFILE="/tmp/pomodoro.pid"
TIMEFILE="/tmp/pomodoro.time"

case "$1" in
    --click)
        if [[ -f "$PIDFILE" ]]; then
            kill "$(cat $PIDFILE)" 2>/dev/null
            rm -f "$PIDFILE" "$TIMEFILE"
        else
            (for ((i=POMODORO_DURATION; i>=0; i--)); do
                echo $i > "$TIMEFILE"
                sleep 1
            done
            notify-send "Pomodoro finished!" "Time for a break!"
            paplay /usr/share/sounds/freedesktop/stereo/complete.oga
            rm -f "$PIDFILE" "$TIMEFILE") &
            paplay /usr/share/sounds/freedesktop/stereo/service-login.oga
            echo $! > "$PIDFILE"
        fi
        ;;
    *)
        if [[ -f "$TIMEFILE" ]]; then
            secs=$(cat "$TIMEFILE")
            mins=$((secs / 60))
            rem=$((secs % 60))
            printf "🍅 %02d:%02d\n" "$mins" "$rem"
        else
            echo "🍅 Start"
        fi
        ;;
esac
