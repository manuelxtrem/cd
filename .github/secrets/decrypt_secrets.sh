#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/profile-gitactions.mobileprovision.mobileprovision ./.github/secrets/profile-gitactions.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/certificate-distro.p12 ./.github/secrets/certificate-distro.p12.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/oka-cash-e78b8f02be55.json ./.github/secrets/oka-cash-e78b8f02be55.json.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/profile-gitactions.mobileprovision.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/profile-gitactions.mobileprovision.mobileprovision


security create-keychain -p "" build5.keychain
security import ./.github/secrets/certificate-distro.p12 -t agg -k ~/Library/Keychains/build5.keychain -P "$IOS_KEYS" -A

security list-keychains -s ~/Library/Keychains/build5.keychain
security default-keychain -s ~/Library/Keychains/build5.keychain
security unlock-keychain -p "" ~/Library/Keychains/build5.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build5.keychain