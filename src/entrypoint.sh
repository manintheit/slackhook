#!/bin/bash
if [ -z "${PROXY}" ]; then
  echo "PROXY is not set"
  python3.9 slack.py
else
  echo "PROXY is set, PROXY address: ${PROXY}"
  export https_proxy="http://${PROXY}"
  python3.9 slack.py
fi