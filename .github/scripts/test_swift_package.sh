#!/bin/bash

set -eo pipefail

cd ios; swift test --parallel; cd ..