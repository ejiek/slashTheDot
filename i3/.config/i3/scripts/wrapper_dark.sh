#!/bin/bash
str=$*
$str | awk '{print "<span background=\x27#FFFFFF\x27 foreground=\x27#000000\x27>"$0"</span>"}'
