# ZSH_CUSTOM
0=${(%):-%N}
ZSH_CUSTOM="${0:a:h:h}"

# Set options we always want no matter what.
setopt INTERACTIVE_COMMENTS EXTENDED_GLOB

# XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$HOME/.xdg}"
export XDG_PROJECTS_DIR="${XDG_PROJECTS_DIR:-$HOME/Workspace}"

for _xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_{RUNTIME,PROJECTS}_DIR;
do
  [[ -e ${(P)_xdgdir} ]] || mkdir -p ${(P)_xdgdir}
  [[ $_xdgdir == XDG_RUNTIME_DIR ]] && chmod 700 ${(P)_xdgdir}
done
unset _xdgdir

# Repos
ZSH_REPO_HOME=$ZSH_CUSTOM/.external
function repo {
  REPO_HOME=$ZSH_REPO_HOME "$ZSH_CUSTOM/plugins/repo/bin/repo" "$@"
}
[[ -d $ZSH_REPO_HOME ]] || repo install <$ZSH_CUSTOM/repos.txt

# OMZ
ZSH=$ZSH_REPO_HOME/ohmyzsh/ohmyzsh

# Helper libs
source $ZSH_CUSTOM/lib/functions.zsh
source $ZSH_CUSTOM/lib/postzshrc.zsh

# Mark this lib as loaded
zstyle ':zsh_custom:lib:__init__' loaded 'yes'
