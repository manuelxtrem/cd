#!/bin/bash
source ./.github/scripts/versioning.sh

VERSION=$(grep version: ./pubspec.yaml | sed 's/version://g' | sed 's/ *$//g')

major=0
minor=0

regex="refs/heads/v([0-9]+).([0-9]+)"
if [[ $SRC_BRANCH =~ $regex ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
fi

echo VERSION_CUR=$VERSION >> $GITHUB_ENV
echo VERSION_NEW=$(version_number $VERSION $major $minor) >> $GITHUB_ENV

