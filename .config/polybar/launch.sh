# # Basic script to kill all old bars and launch new.

# # Terminate already running bad instances
# killall -q polybar

# # Wait until the processes have been shut down
# while grep -x polybar >/dev/null; do sleep 1; done

# # Launch the example bar
# polybar main_bar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1);do
    MONITOR=$m polybar --reload lamia 2>&1 &
done
# # Launch bar1 and bar2
# polybar lamia 2>&1 &

echo "launched polybar"

