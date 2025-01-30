# Close existing polybars
polybar-msg cmd quit
# Uncomment below to kill with fire:
# killall -q polybar

# Open polybar on all monitors (from typecraft)
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi
