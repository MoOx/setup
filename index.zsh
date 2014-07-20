export DOTFILES=$HOME/dotfiles
export PATH=$DOTFILES/bin:$PATH

# load colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    # todo wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval COLOR_$COLOR='$fg_no_bold[${(L)COLOR}]'
    eval COLOR_$COLOR_BOLD='$fg_bold[${(L)COLOR}]'
done
eval COLOR_RESET='$reset_color'

# add some helpers for display
export CHAR_OK=✔
export CHAR_ERROR=✗
export CHAR_BOOM=💥
export CHAR_STARTER=❯
function echo_info () { echo "${COLOR_BLUE}i${COLOR_RESET} $1" }
function echo_user () { echo "${COLOR_YELLOW}?${COLOR_RESET} $1" }
function echo_success () { echo "${COLOR_GREEN}${CHAR_OK}${COLOR_RESET} $1" }
function echo_fail () { echo "${COLOR_RED}${CHAR_ERROR}${COLOR_RESET} $1|n"; exit }
function echo_title () { echo "${COLOR_CYAN}${CHAR_STARTER} $@${COLOR_RESET}" }
function echo_title_install () { echo_title "Installing" $1 "..." }
function echo_title_update () { echo_title "Updating" $1 "..." }
function echo_title_installupdate () { echo_title "Installing/Updating" $1 "..." }
function setup () {
  COMPONENT_SETUP="$DOTFILES/components/$1/setup"
  if [[ -f "$COMPONENT_SETUP" ]]
  then
    source "$COMPONENT_SETUP"
  else
    echo "Fail to setup $1: no setup file in '$COMPONENT_SETUP'"
  fi
}

# stupid var to avoid Darwin test all the time
# not sure it's better
export OS=unix
if [[ $(uname) = "Darwin" ]]; then; export OS=osx; fi
#if [[ $OS == "osx" ]]; then; echo "yeahyyyy"; fi

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -f ~/.localrc ]]; then; source ~/.localrc; fi

##
# Source topic files
##
typeset -U config_files
config_files=($DOTFILES/components/*/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit
# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done
unset config_files

##
# Load all functions files
##
typeset -U config_files
function_files=($DOTFILES/*/*/functions/*)
for file in $function_files
do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset function_files
