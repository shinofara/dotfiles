#peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

set PATH /opt/homebrew/bin $PATH

export LSCOLORS=Gxfxcxdxbxegedabagacad
set PATH /Users/shinofara/google-cloud-sdk/bin $PATH

# Created by `pipx` on 2021-03-23 14:27:08
set PATH $PATH /Users/shinofara/.local/bin
set PATH $PATH /Users/shinofara/go/bin
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH