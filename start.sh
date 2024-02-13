#!/bin/bash

set -eu

if [[ ! -f /app/data/env.sh ]]; then
    cp /app/pkg/env.sh.template /app/data/env.sh
fi 

source /app/data/env.sh

# default settings for cloudron
export DATABASE_PATH="/app/data/db"
export USERDATA_PATH="/app/data/users.json"
export DOMAIN="${CLOUDRON_APP_DOMAIN}"

if [ ! -f "$USERDATA_PATH" ]; then
    echo "{}" > "$USERDATA_PATH"
fi

chown -R cloudron:cloudron /app/data

exec /app/code/khatru

