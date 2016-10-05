#!/bin/bash
lscpu | grep 'CPU MHz' | awk '{ print $3 " MHz"}'
