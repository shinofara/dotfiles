#!/bin/sh
CURRENT_DIR=$(pwd)

echo "Start brew bundle"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle

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
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

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
