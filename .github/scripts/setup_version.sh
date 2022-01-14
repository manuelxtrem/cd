#!/bin/bash

### Increments the part of the string

version_number() {
  version="$1"
  major=0
  minor=0
  patch=0
  build=0

  # break down the version number into it's components
  regex="([0-9]+).([0-9]+).([0-9]+)\+([0-9]+)"
  if [[ $version =~ $regex ]]; then
    major="${BASH_REMATCH[1]}"
    minor="${BASH_REMATCH[2]}"
    patch="${BASH_REMATCH[3]}"
    build="${BASH_REMATCH[4]}"
  fi

  # check paramater to see which number to increment
  if [[ "$2" == "minor" ]]; then
    minor=$(echo $minor + 1 | bc)
    patch=0
    build=$(echo $build+1 | bc)
  elif [[ "$2" == "patch" ]]; then
    patch=$(echo $patch + 1 | bc)
    build=$(echo $build+1 | bc)
  elif [[ "$2" == "major" ]]; then
    major=$(echo $major+1 | bc)
    minor=0
    patch=0
    build=$(echo $build+1 | bc)
  elif [[ "$2" == "build" ]]; then
    build=$(echo $build+1 | bc)
  elif [[ "$2" == "none" ]]; then
    build=$(echo $build | bc)
  else
    echo "usage: version_number [major/minor/patch/build]"
    exit -1
  fi

  # echo the new version number
  echo "${major}.${minor}.${patch}+${build}"
}


export VERSION=$(grep version: ./pubspec.yaml | sed 's/version://g' | sed 's/ *$//g')
# echo VERSION=$VERSION >> $GITHUB_ENV
echo VERSION=$(version_number $VERSION none) >> $GITHUB_ENV
echo VERSION_MAJOR=$(version_number $VERSION major) >> $GITHUB_ENV
echo VERSION_MINOR=$(version_number $VERSION minor) >> $GITHUB_ENV
echo VERSION_PATCH=$(version_number $VERSION patch) >> $GITHUB_ENV
echo VERSION_BUILD=$(version_number $VERSION build) >> $GITHUB_ENV
