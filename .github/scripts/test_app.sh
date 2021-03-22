#!/bin/bash

set -eo pipefail

xcodebuild -workspace ios/Runner.xcworkspace \
            -scheme Runner \
            -destination platform=iOS\ Simulator,OS=13.3,name=iPhone\ 11 \
            clean test