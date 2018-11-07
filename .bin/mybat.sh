#!/bin/bash

batterys_dir="/sys/bus/acpi/drivers/battery"
battery="PNP0C0A:00"
battery_num="BAT0"
battery_dir="${batterys_dir}/${battery}/power_supply/${battery_num}/"

energy_full=$(cat "${battery_dir}/energy_full")
energy_now=$(cat "${battery_dir}/energy_now")
power_now=$(cat "${battery_dir}/power_now")

percent=$(expr 100 \* ${energy_now} / ${energy_full})
time_remaining=$(expr 60 \* ${energy_now} / ${power_now})

if [ "$1" == "--time" ]; then
    echo $time_remaining
fi

if [ "$1" == "--percent" ] || [ "$1" == "" ]; then
    echo $percent
fi
