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
brew "mole"                         # deep clean and optimize the Mac
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
brew "python@3.13"
brew "python@3.11"                  # TODO Max: still needed, or a leftover?
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

cask "openlogi"                     # local-first alternative to Logitech Options+
cask "temurin@21"                   # JDK, for Android builds

# Deliberately absent, so the reasons are not lost:
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
