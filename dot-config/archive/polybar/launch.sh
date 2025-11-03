#!/bin/bash

killall polybar

prim=$(polybar --list-monitors | grep primary | cut -d':' -f1)
others=$(polybar --list-monitors | grep -v primary | cut -d':' -f1)

for m in $prim; do
    MONITOR=$m polybar --reload bar1 &
done

for m2 in $others; do
    MONITOR=$m2 polybar --reload bar2 &
done
