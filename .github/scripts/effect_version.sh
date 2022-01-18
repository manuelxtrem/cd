#!/bin/bash
echo "replacing version in pubspec file"
echo "old version: $VERSION_CUR"

sed -i '' "s/version: $VERSION_CUR/version: $VERSION_NEW/g" pubspec.yaml

echo "new version: $VERSION_NEW"