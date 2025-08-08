#!/bin/bash

# ~/sketchybar/plugins/ram.sh
USED=$(vm_stat | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
WIRED=$(vm_stat | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
COMPRESSED=$(vm_stat | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')
TOTAL_PAGES=$(vm_stat | grep "Pages free" | awk '{print $3}' | sed 's/\.//')

PAGE_SIZE=$(sysctl -n hw.pagesize)
TOTAL_MEM=$(sysctl -n hw.memsize)

USED_MEM=$((($USED + $WIRED + $COMPRESSED) * $PAGE_SIZE))
PERCENT=$((100 * $USED_MEM / $TOTAL_MEM))

sketchybar --set $NAME label="${PERCENT}%"

