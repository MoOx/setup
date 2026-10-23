# What this machine is meant to have. Intent, not state.
#
# Only tools chosen on purpose are listed. Libraries are left out: Homebrew
# resolves them, and declaring them hides what was actually wanted. Rebuild this
# list with `./setup brew`, which diffs the machine against this file in both
# directions and offers to reconcile.
#
# Built on 2026-10-22 from the 68 formulae flagged installed_on_request, reduced
# to the 31 that nothing else in the list already pulls in, minus 8 orphan
# libraries (see the note at the bottom).

tap "mobile-dev-inc/tap"
tap "symfony-cli/tap"

# Shell and system
brew "direnv"                       # per-directory environment variables
brew "trash"                        # move to the trash instead of rm
brew "unbound"                      # local validating DNS resolver
brew "mas"                          # Mac App Store CLI, needed to inventory installed apps
brew "terminal-notifier"            # clickable notification for the weekly setup --check

# Git and GitHub
brew "gh"                           # GitHub CLI
brew "git-cliff"                    # changelog generator, used by the changelog function

# Languages and version managers
brew "fnm"                          # Node version manager
brew "yarn"                         # JavaScript package manager
brew "rbenv"                        # Ruby version manager
brew "php@8.4"
brew "composer"                     # PHP dependency manager
brew "symfony-cli/tap/symfony-cli"
brew "pipx"                         # run Python CLI tools in isolated environments

# Mobile
brew "fastlane"                     # build and release the iOS and Android apps
brew "xcodes"                       # install and switch Xcode versions
brew "scrcpy"                       # mirror and control an Android device
brew "mobile-dev-inc/tap/maestro"   # mobile UI test automation
brew "watchman"                     # file watcher, required by React Native

# Media
brew "ffmpeg"                       # used directly by the dl aliases and by beets
brew "yt-dlp"                       # audio and video downloader
brew "aria2"                        # resumable segmented downloads
brew "imagemagick"
brew "chromaprint"                  # audio fingerprinting, for beets
brew "whisper.cpp"                  # local speech to text

# Documents
brew "poppler"                      # PDF rendering and CLI tools
brew "ocrmypdf"                     # add an OCR layer to scanned PDFs

# Cloud and models
brew "rclone"                       # rsync for cloud storage
brew "ollama"                       # run local LLMs

# GPG, kept only because poppler depends on gnupg
brew "pinentry-mac"                 # lets gnupg read its passphrase from the keychain

# Casks. Everything here was already installed by hand and adopted with
# `brew install --cask --adopt`, so the app stayed in place and Homebrew took
# it over. On a new machine they install normally.

# Daily
cask "claude"
cask "visual-studio-code"
cask "slack"
cask "discord"
cask "notion"
cask "figma"
cask "google-chrome"
cask "firefox"
cask "microsoft-edge"

# Desktop
cask "maccy"                        # clipboard history, replaces Flycut
cask "rectangle"                    # window shortcuts
cask "betterdisplay"
cask "istat-menus"
cask "nightfall"
cask "openlogi"                     # local-first alternative to Logitech Options+
cask "pearcleaner"                  # browse and clean, replaces the mole CLI
cask "appcleaner"

# Mobile and build
cask "android-studio"
cask "expo-orbit"
cask "temurin@21"                   # JDK, for Android builds
cask "iterm2"
cask "github"                       # GitHub Desktop
cask "docker-desktop"               # a .pkg cask: install it, never --adopt it

# Media and files
cask "vlc"
cask "imageoptim"
cask "webtorrent"
cask "sketch"
cask "capcut"
cask "djstudio"
cask "musicbrainz-picard"
cask "transmission"
cask "yate"

# Office and cloud
cask "libreoffice"
cask "microsoft-teams"
cask "google-drive"

# Utilities
cask "grandperspective"             # disk usage treemap
cask "knockknock"                   # what is persistently installed on the Mac

# Design
cask "sf-symbols"

# Games and music
cask "steam"
cask "epic-games"
cask "mixed-in-key"

# Mac App Store, listed by `mas list`. These reinstall without a browser and
# without a licence key, which is why they are worth declaring. TODO Max: prune
# what you no longer want, the list is only what is installed today.
mas "Xcode", id: 497799835
mas "Pixelmator Pro", id: 1289583905
mas "Infuse", id: 1136220934
mas "One Markdown", id: 1507139439
mas "DevCleaner", id: 1388020431
mas "The Unarchiver", id: 425424353
mas "1Blocker", id: 1365531024
mas "WhatsApp", id: 310633997
mas "Keynote", id: 361285480
mas "Numbers", id: 361304891
mas "Pages", id: 361309726
mas "Balatro", id: 6502451661

# Deliberately absent, so the reasons are not lost:
#
# - No python at all. Four were installed: 3.11 and 3.13 had no dependent and
#   were uninstalled, while `python3` actually resolves to 3.15, which arrives
#   with ollama, pipx and watchman. 3.14 arrives with ocrmypdf and yt-dlp.
#   Declaring a version would pin something that ages for no gain; if `python3`
#   ever disappears, `brew install python3` is one command.
# - mole, uninstalled. Its CLI was not the right shape for browsing and
#   cleaning, which is what Pearcleaner already does with a window.
# - Flycut, replaced by Maccy: its last release was 2020. Until the App Store
#   copy is removed with `sudo mas uninstall 442160987`, `setup --check` will
#   report it as installed and undeclared, which is the reminder.
#
# - 8 orphan libraries that were installed by hand and that nothing needs any
#   more: jpeg-xl, libass, libbluray, libraw, librist, librsvg, libssh, srt.
#   Verified: neither ffmpeg nor imagemagick depends on any of them today. They
#   are leftovers from an older ffmpeg formula. Still installed on this machine,
#   removable with `brew uninstall`.
# - 3 unused taps: stripe/stripe-cli, supabase/tap, wix-incubator/brew, none of
#   which has a single installed package.
# - Every library another listed package already pulls in: ffmpeg's codecs,
#   watchman's C++ stack (folly, fizz, wangle, fbthrift, fb303, edencommon),
#   the font and image stack, openssl, gnupg itself, tesseract and ghostscript
#   for ocrmypdf, ruby-build for rbenv.
# - The ~70 GUI applications installed by hand. They belong in the app registry,
#   which is a separate pass: adopting an already-installed app as a cask needs
#   care, so pearcleaner and grandperspective are not listed yet.
