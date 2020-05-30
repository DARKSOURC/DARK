#!/usr/bin/env bash
cd $HOME/DarK
rm -rf $HOME/.telegram-cli
ins() {
sudo chmod +x tg
chmod +x DarK
chmod +x tk
./tk
}
if [ "$1" = "ins" ]; then
ins
fi
chmod +x ins.sh
lua run.lua
