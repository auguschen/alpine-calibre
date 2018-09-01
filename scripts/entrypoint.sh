#!/usr/bin/env sh

if [[ -n "$LIB_PATH" ]]; then
  nginx && python cps.py -p $LIB_PATH
else
  nginx && python cps.py
fi
