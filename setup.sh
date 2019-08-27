#! /bin/bash

cd "$HOME"
chmod a+r content
chmod a+r core
chmod a+r site

ghost config --port "$PORT" --url "http://localhost:$PORT" --dbpath "$HOME/site/data/ghost-local.db"
ghost config paths.contentPath "$HOME/site"