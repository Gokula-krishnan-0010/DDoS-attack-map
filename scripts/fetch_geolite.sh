#!/usr/bin/env bash
set -euo pipefail
source backend/.env
mkdir -p backend/data && cd backend/data
for ED in GeoLite2-City GeoLite2-ASN; do
  curl -sSL -u "$MAXMIND_ACCOUNT_ID:$MAXMIND_LICENSE_KEY" \
    "https://download.maxmind.com/geoip/databases/$ED/download?suffix=tar.gz" -o "$ED.tar.gz"
  tar -xzf "$ED.tar.gz" --strip-components=1 --wildcards "*/$ED.mmdb"
  rm "$ED.tar.gz"
done
ls -lh *.mmdb
