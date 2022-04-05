#!/usr/bin/env fish

function print_time
    # set -f local_timezone_time (date -Iseconds)
    set -f utc_timezone_time (date -uIseconds)
    set -f uptime (uptime)
    # set -f battery (cat /sys/class/power_supply/BAT0/capacity)
    set -f battery_charge_now \
       (cat /sys/class/power_supply/BAT0/charge_now)
    set -f battery_charge_full \
       (cat /sys/class/power_supply/BAT0/charge_full)
    set -f battery_charge_percentage \
       (math "$battery_charge_now / $battery_charge_full * 100")
    set -f local_timezone_date (date +'%a %Y-%m-%d')
    echo "$local_timezone_date$uptime | $utc_timezone_time" \
         "| $battery_charge_percentage%"
end

while true
    print_time
    sleep 1
end
