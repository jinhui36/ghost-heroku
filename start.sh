#! /bin/bash
echo "test">test.txt
cd ghost
ln -s config.development.json config.production.json
ghost config --port "$PORT" --url "http://localhost:$PORT" --dbpath "$HOME/ghost/content/data/ghost-local.db"
ghost config paths.contentPath "$HOME/ghost/content"
ghost start