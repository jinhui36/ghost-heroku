#! /bin/bash

GHOST_CLI_VERSION="1.11.0"
GHOST_VERSION="2.25.9"
GHOST_INSTALL="$HOME"
GHOST_CONTENT="$GHOST_INSTALL/content"
npm install -g "ghost-cli@$GHOST_CLI_VERSION"
npm cache clean --force

node ghost install "$GHOST_VERSION" --db sqlite3 --no-prompt --no-stack --no-setup --dir "$GHOST_INSTALL"

# Tell Ghost to listen on all ips and not prompt for additional configuration
cd "$GHOST_INSTALL"
node ghost config --ip 0.0.0.0 --port "$PORT" --no-prompt --db sqlite3 --url "http://localhost:$PORT" --dbpath "$GHOST_CONTENT/data/ghost.db"
node ghost config paths.contentPath "$GHOST_CONTENT"

# make a config.json symlink for NODE_ENV=development (and sanity check that it's correct)
node ln -s config.production.json "$GHOST_INSTALL/config.development.json"
readlink -f "$GHOST_INSTALL/config.development.json"

node yarn cache clean
node npm cache clean --force
npm cache clean --force

