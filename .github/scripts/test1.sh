#!/bin/bash
echo VERSION=$(grep version: pubspec.yaml) >> $GITHUB_ENV