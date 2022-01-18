#!/bin/bash

# if branch looks like v*.*, get the *.*, and create a version from it

export src=$SRC_BRANCH

major=0
minor=0

regex="refs/heads/v([0-9]+).([0-9]+)"
if [[ $src =~ $regex ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
fi

VERSION_NEW=""

if [ "$minor" == "0" ]; then 
  VERSION_NEW=$VERSION_PATCH
else
  if [ "$major" == "0" ]; then 
    VERSION_NEW=$VERSION_MINOR
  else
    VERSION_NEW=$VERSION_MAJOR
  fi;
fi;

echo VERSION_NEW=$VERSION_NEW >> $GITHUB_ENV