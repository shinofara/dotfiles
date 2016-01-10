#!/bin/bash

## install fontforge
brew install fontforge

##mkdir work
mkdir ~/.Trash/ricty
cd ~/.Trash/ricty

## get fontfiles
curl -L -o 'Inconsolata.otf' 'http://levien.com/type/myfonts/Inconsolata.otf'
curl -L -o 'migu-1m-20130617.zip' 'http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip'
unzip migu-1m-20130617.zip

## get Ricty generator
curl -L -o 'Ricty-3.2.2.tar.gz' 'https://github.com/yascentur/Ricty/tarball/3.2.2'
tar zxvf Ricty-3.2.2.tar.gz

## generate & install Ricty
cp Inconsolata.otf yascentur-Ricty-36c4bc7/
cp migu-1m-20130617/*ttf yascentur-Ricty-36c4bc7/
./yascentur-Ricty-36c4bc7/ricty_generator.sh ./yascentur-Ricty-36c4bc7/Inconsolata.otf ./yascentur-Ricty-36c4bc7/migu-1m-regular.ttf ./yascentur-Ricty-36c4bc7/migu-1m-bold.ttf
sudo cp Ricty*.ttf /Library/Fonts/

## delete
cd ~/
rm -rf ~/.Trash/ricty
