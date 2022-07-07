#!/bin/sh
CURRENT_DIR=$(pwd)

echo "Start brew bundle"

/opt/homebrew/bin/brew bundle

echo "End brew bundle"

echo "Start Font"
cp -f /opt/homebrew/opt/ricty/share/fonts/Ricty* ~/Library/Fonts/
fc-cache -vf
echo "End Font"

## Fish Setup

echo "Start setup fish"

if [ ! -f /opt/homebrew/bin/fish ]; then 
    sudo su
    echo /opt/homebrew/bin/fish >> /etc/shells
fi
mkdir -p .config/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

cd /tmp
gh repo clone powerline/fonts
cd fonts
./install.sh
cd $CURRENT_DIR
rm -rf /tmp/fonts
cp .config/fish/* ~/.config/fish/



fisher install oh-my-fish/plugin-peco oh-my-fish/theme-bobthefish 0rax/fish-bd


echo "End setup fish"

## Volta(For Node.js)
echo "Start setup Volta"

curl https://get.volta.sh | bash
export VOLTA_HOME=$HOME/.volta
export PATH=$PATH:$HOME/.volta:$VOLTA_HOME/bin
volta install node

echo "End setup Volta"

## Tmux

cp .tmux.conf ~/

## Emacs

echo "Start Emacs"
rm -rf ~/.emacs.d
cp -r .emacs.d ~/
echo "End Emacs"
