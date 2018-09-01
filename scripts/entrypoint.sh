#!/usr/bin/env sh

if [[ -n "$LIB_PATH" ]]; then
  python cps.py -p $LIB_PATH
else
  python cps.py
fi
