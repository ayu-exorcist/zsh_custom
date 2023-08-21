#
# directory - set directory options and aliases
#

setopt auto_pushd              # Make cd push the old directory onto the dirstack.
setopt pushd_ignore_dups       # Don’t push multiple copies of the same directory onto the dirstack.
setopt pushd_minus             # Exchanges meanings of +/- when navigating the dirstack.
setopt pushd_silent            # Do not print the directory stack after pushd or popd.
setopt pushd_to_home           # Push to home directory when no argument is given.
setopt multios                 # Write to multiple descriptors.
setopt glob_dots               # Don't hide dotfiles from glob patterns.
setopt NO_clobber              # Don't overwrite files with >. Use >| to bypass.
setopt NO_rm_star_silent       # Ask for confirmation for `rm *' or `rm path/*'

alias dirh='dirs -v'
