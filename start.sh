#! /bin/bash
if [ -f "$HOME/config.development.json" ];then
    ./setup.sh
fi
node ghost config --port "$PORT" --url "http://localhost:$PORT"
node ghost start