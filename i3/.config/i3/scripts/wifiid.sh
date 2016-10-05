#!/bin/bash

STRENGTH=$(awk 'NR==3 {print $3}''' /proc/net/wireless | sed 's/\.//g')

echo "$STRENGTH"

