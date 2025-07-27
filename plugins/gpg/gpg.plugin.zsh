#
# gpg: Customize GNUPG
#

export GNUPGHOME=${GNUPGHOME:=${XDG_DATA_HOME:-$HOME/.local/share}/gnupg}
[[ -e $GNUPGHOME:h ]] || mkdir -p $GNUPGHOME:h
alias gpg="${aliases[gpg]:-gpg} --homedir \"$GNUPGHOME\""

# Mark the plugin as loaded
zstyle ':zsh_custom:plugin:gpg' loaded 'yes'
