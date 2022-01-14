#!/bin/bash
echo "s/version: $VERSION/version: $VERSION_NEW/g"
sed -i pubspec.yaml "s/version: $VERSION/version: $VERSION_NEW/g" pubspec.yaml