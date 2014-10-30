export DOTFILES=$HOME/dotfiles
export PATH=$DOTFILES/setupsh/bin:$PATH

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
function echo_fail () { echo "${COLOR_RED}${CHAR_ERROR}${COLOR_RESET} $1\n"; exit }
function echo_title () { echo "${COLOR_CYAN}${CHAR_STARTER} $@${COLOR_RESET}" }
function echo_title_install () { echo_title "Installing" $1 "..." }
function echo_title_update () { echo_title "Updating" $1 "..." }
function echo_title_installupdate () { echo_title "Installing/Updating" $1 "..." }

# stupid var to avoid Darwin test all the time
# not sure it's better
export OS=unix
if [[ $(uname) = "Darwin" ]]; then; export OS=osx; fi
#if [[ $OS == "osx" ]]; then; echo "yeahyyyy"; fi

# load setupsh core functions
for file in $DOTFILES/setupsh/functions/*
do
  # echo "Sourcing $file"
  source $file
done

##
# Source packages
##
typeset -U config_files
config_files=($DOTFILES/packages/*.zsh)

# load the path files
sourceFiles ${(M)config_files:#*.path.zsh}

# load everything but the path and completion files
sourceFiles ${${config_files:#*.path.zsh}:#*.completion.zsh}

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit
# load every completion after autocomplete loads
sourceFiles ${(M)config_files:#*.completion.zsh}
unset config_files

loadFunctionsFromPath $DOTFILES/setupsh/functions
loadFunctionsFromPath $DOTFILES/functions
