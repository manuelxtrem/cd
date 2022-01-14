#!/bin/bash

# sed -i '' 'version: 1.0.0+1' pubspec.yaml
export VERSION='1.0.3+14'
export VERSION_U='1.0.0+1'
# export VERSION='1.0.0+1'
# export VERSION_U='1.0.3+14'

sed -i '' "s/version: $VERSION/version: $VERSION_U/g" pubspec.yaml
