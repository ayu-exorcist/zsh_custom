#
# directory: Set features related to Zsh directories and dirstack.
#

# Return if requirements are not met.
[[ "$TERM" != 'dumb' ]] || return 1

# Set Zsh options related to directories, globbing, and I/O.
setopt auto_pushd         # Make cd push the old directory onto the dirstack.
setopt pushd_minus        # Exchanges meanings of +/- when navigating the dirstack.
setopt pushd_silent       # Do not print the directory stack after pushd or popd.
setopt pushd_to_home      # Push to home directory when no argument is given.
setopt multios            # Write to multiple descriptors.
setopt extended_glob      # Use extended globbing syntax (#,~,^).
setopt glob_dots          # Don't hide dotfiles from glob patterns.
setopt NO_clobber         # Don't overwrite files with >. Use >| to bypass.
setopt NO_rm_star_silent  # Ask for confirmation for `rm *' or `rm path/*'

# Set directory aliases.
if ! zstyle -t ':zsh_custom:plugin:directory:alias' skip; then
  alias -- -='cd -'
  alias dirh='dirs -v'

  _dotdot=".."
  for _index in {1..9}; do
    alias "$_index"="cd -${_index}"      # dirstack aliases (eg: "2"="cd -2")
    alias -g "..${_index}"="${_dotdot}"  # backref aliases (eg: "..3"="../../..")
    _dotdot+="/.."
  done
  unset _dotdot _index
fi

if ! zstyle -t ':zsh_custom:plugin:directory:functions' skip; then
  # Quickly go up any number of directories.
  function up {
    local parents=${1:-1}
    if ! (( "$parents" > 0 )); then
      echo >&2 "up: expecting a numeric parameter"
      return 1
    fi
    local i dotdot=".."
    for ((i = 1 ; i < parents ; i++)); do
      dotdot+="/.."
    done
    cd $dotdot
  }
fi

# Mark the plugin as loaded.
zstyle ':zsh_custom:plugin:directory' loaded 'yes'
