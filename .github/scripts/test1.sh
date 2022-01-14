#!/bin/bash

### Increments the part of the string
## $1: version itself
## $2: number of part: 0 – major, 1 – minor, 2 – patch

increment_version() {
  local delimiter=.
  local array=($(echo "$1" | tr $delimiter '\n'))
  array[$2]=$((array[$2]+1))
  if [ $2 -lt 2 ]; then array[2]=0; fi
  if [ $2 -lt 1 ]; then array[1]=0; fi
  echo $(local IFS=$delimiter ; echo "${array[*]}")
}


echo VERSION=$(grep version: pubspec.yaml | sed 's/version://g' | sed 's/ *$//g') >> $GITHUB_ENV
echo VERSION_1=$(increment_version VERSION 0) >> $GITHUB_ENV
echo VERSION_2=$(increment_version VERSION 1) >> $GITHUB_ENV
echo VERSION_3=$(increment_version VERSION 2) >> $GITHUB_ENV
