#!/bin/bash
export VERSION=$(grep version: pubspec.yaml)
echo "::set-env name=VERSION::$VERSION"