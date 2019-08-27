#! /bin/bash

cd ghost
ln -s config.development.json config.production.json
node ghost config --port "$PORT" --url "http://localhost:$PORT" --dbpath "$HOME/ghost/content/data/ghost-local.db"
node ghost config paths.contentPath "$HOME/ghost/content"
node ghost start