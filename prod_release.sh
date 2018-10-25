#!/usr/bin/env bash

# Need to have gloud SDK installed https://cloud.google.com/sdk/

export MIX_ENV=prod

# Build assets
cd assets
npm install
./node_modules/brunch/bin/brunch build -p
cd ..
mix phx.digest

# Create the release
mix release --env=prod
gcloud app deploy
