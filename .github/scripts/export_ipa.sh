#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/Runner.xcarchive \
            -exportOptionsPlist ios/Runner/ExportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty