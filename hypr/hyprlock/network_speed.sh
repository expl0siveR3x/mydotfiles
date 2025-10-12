#!/bin/bash

IFACE=$(nmcli -t -f DEVICE,STATE device | grep ":connected" | cut -d":" -f1)

RX_PREV=0
TX_PREV=0

while true; do
  RX=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
  TX=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

  if [ $RX_PREV -ne 0 ]; then
    RX_RATE=$(((RX - RX_PREV) / 1024))
    TX_RATE=$(((TX - TX_PREV) / 1024))
  else
    RX_RATE=0
    TX_RATE=0
  fi

  echo "$RX_RATE $TX_RATE" >/tmp/net_speed

  RX_PREV=$RX
  TX_PREV=$TX

  sleep 1
done
