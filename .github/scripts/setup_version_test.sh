#!/bin/bash

source ./.github/scripts/versioning.sh

expect() {
  if [ "$1" == "$2" ]; then
    echo "PASSED :: $1 matches $2"
  else
    echo "FAILED :: $1 does not match $2"
  fi
}

expect $(version_number "0.1.1+1" 0 0) "0.1.1+2"
expect $(version_number "0.1.1+1" 0 1) "0.1.2+2"
expect $(version_number "0.1.1+1" 0 2) "0.2.0+2"
expect $(version_number "0.1.1+1" 1 3) "1.3.0+2"
expect $(version_number "0.1.1+1" 2 0) "2.0.0+2"
