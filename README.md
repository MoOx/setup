# MoOx `setup`

> Dotfiles, aliases, functions, preferences, apps. Everything.

![kaboom](https://raw.githubusercontent.com/MoOx/setup/master/.kaboom.gif)

## From time to time

```console
zprezto-update

git -C $SETUP_PATH pull origin master

source $SETUP_PATH/dotfiles/.zshrc

sourceFiles $SETUP_PATH/preferences/*.prefs

brew upgrade

brew bundle check

$SETUP_PATH/scripts/vscode-backup.sh
```

## First run

Open App Store, get your apps you download from this place (hello Xcode), then

```console
export SETUPSH_GIT_NAME=MoOx
export SETUPSH_GIT_EMAIL=
export SETUPSH_PHONE=
export SETUP_PATH=$HOME/setup

# Ask for the administrator password upfront
sudo -v

# security
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo launchctl load /System/Library/LaunchDaemons/com.apple.alf.agent.plist 2>/dev/null
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText  "Found this computer? Please contact $SETUPSH_GIT_NAME at $SETUPSH_GIT_EMAIL or +33$SETUPSH_PHONE for a reward.\nVous avez trouver cet ordinateur? Merci de contacter $SETUPSH_GIT_NAME à $SETUPSH_GIT_EMAIL ou au 0$SETUPSH_PHONE pour une récompense."

# install pretzo
# https://github.com/sorin-ionescu/prezto/#installation
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# define zsh as default shell
chsh -s /bin/zsh $USER

# Command Line Tools (CLT) for Xcode
xcode-select --install
sudo xcodebuild -license

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone https://github.com/$SETUPSH_GIT_NAME/setup.git $SETUP_PATH

for file in $SETUP_PATH/functions/* do; source $file; done

sourceFiles $SETUP_PATH/preferences/*.prefs

dotfiles

mv $HOME/Library/Application\ Support/Code/User SETUP_PATH/dotfiles/.vscode-Library___Application\ Support___Code___User || mkdir -p $HOME/Library/Application\ Support/Code
ln -s SETUP_PATH/dotfiles/.vscode-Library___Application\ Support___Code___User $HOME/Library/Application\ Support/Code/User

source $SETUP_PATH/.zshrc

macos-hidden-show

brew cask install "syncthing-bar"

# then configure syncthing and way for the sync

source ./setup/scripts/custom-folders.sh

brew install mas

mas signin --dialog $SETUPSH_GIT_EMAIL

brew bundle

# https://github.com/Schniz/fnm
#curl https://raw.githubusercontent.com/Schniz/fnm/master/.ci/install.sh | bash
#fnm install latest-v10.x
```

Also good to do

- Safari uBlock Origin https://safari-extensions.apple.com/details/?id=com.el1t.uBlock-3NU33NW2M3
- Safari Pocket https://safari-extensions.apple.com/details/?id=com.ideashower.pocket.safari-ET279A6R5N
- Remove Google as default search engine
