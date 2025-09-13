#
# gpg: Customize GNUPG
#


if ! (( $+commands[gpg] )); then
  echo "gnupg not found.\nPlease download and install it from https://www.gnupg.org/." >&2
  return 1
fi

export GNUPGHOME=${GNUPGHOME:=${XDG_DATA_HOME:-$HOME/.local/share}/gnupg}
[[ -e $GNUPGHOME ]] || mkdir -p $GNUPGHOME
chmod 700 "$GNUPGHOME"
alias gpg="${aliases[gpg]:-gpg} --homedir \"$GNUPGHOME\""

# Mark the plugin as loaded
zstyle ':zsh_custom:plugin:gpg' loaded 'yes'
