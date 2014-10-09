command -v brew > /dev/null && alias caskroom="cd $(brew --prefix)/Library/Taps/caskroom"
alias brewu="brew update && brew upgrade && brew cleanup && brew cask cleanup"
