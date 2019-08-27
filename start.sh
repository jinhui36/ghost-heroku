#! /bin/bash

cd ghost

ghost config --port "$PORT" --url "http://localhost:$PORT" --dbpath "$HOME/ghost/content/data/ghost-local.db"
ghost config paths.contentPath "$HOME/ghost/content"
node current/index.js