#!/bin/sh
DRCOM_PID=/var/run/drcom-wrapper.pid
while true; do
drcom_openwrt &
echo $$ $! > "$DRCOM_PID"
wait
echo $$ > "$DRCOM_PID"
sleep 0.25
done

