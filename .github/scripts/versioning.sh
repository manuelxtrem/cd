#!/bin/bash

### Increments the part of the version string
version_number() {
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "usage: version_number [current_version] [branch_major] [branch_minor]"
    return
  fi

  version="$1"
  branch_major="$2"
  branch_minor="$3"
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

  if [ "$branch_minor" == "0" ] && [ "$branch_major" == "0" ]; then
    build=$(echo $build+1 | bc)
  else
    if [ "$branch_minor" == "$minor" ]; then 
      minor=$minor
      patch=$(echo $patch + 1 | bc)
    else
      minor=$branch_minor
      patch=0
    fi

    if [ "$branch_major" == "$major" ]; then 
      major=$major
    else
      major=$branch_major
      # minor=0
      # patch=0
    fi
    
    build=$(echo $build+1 | bc)
  fi

  # echo the new version number
  echo "${major}.${minor}.${patch}+${build}"
}
