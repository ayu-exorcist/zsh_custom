#
# mise: Configure mise.
#

if ! (( $+commands[mise] )); then
  echo "mise not found" >&2
  return 1
fi

# https://github.com/jdx/mise
if (( $+functions[cached-eval] )); then
  cached-eval 'mise-activate-zsh' eval "$(mise activate zsh)"
else
  source <(eval "$(mise activate zsh)")
fi

# Mark the plugin as loaded
zstyle ':zsh_custom:plugin:mise' loaded 'yes'
