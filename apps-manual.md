# Applications

What the `Brewfile` cannot reinstall on its own, and why.

Inventory taken on 2026-10-22: **69 apps**, 11 from the App Store, 56 installed
by hand, the rest from Homebrew. Sources were read locally, not guessed: an App
Store app carries a `_MASReceipt` inside its bundle, and last use comes from
Spotlight's `kMDItemLastUsedDate`.

Everything that has a cask has been adopted with `brew install --cask --adopt`,
so it keeps the installed app in place and makes Homebrew manage it from now on.
Those apps are in the `Brewfile`. What follows is the remainder.

## No cask exists: reinstall by hand

| App | Last used | Where it comes from |
| --- | --- | --- |
| Safari | daily | ships with macOS, nothing to do |
| Xcode | 2026-10-20 | App Store, or `xcodes` which is in the Brewfile |
| SF Symbols Beta | 2026-08-27 | Apple Developer downloads |
| JPEGmini Pro | 2026-10-21 | **paid**, licence to record |
| AzireVPN | 2026-10-21 | vendor download |
| Mixed In Key 11 | 2026-03-08 | **paid**, licence to record. A `mixed-in-key` cask exists but tracks another version |
| The Tagger | 2026-03-08 | **paid**, licence to record |
| LG Switch | 2026-02-17 | LG, monitor utility |
| FAZUA Toolbox | 2026-07-31 | FAZUA, bike drive utility |
| Nicotine+ | 2026-06-07 | open source, vendor download |
| Epic Games Launcher | 2026-01-22 | an `epic-games` cask exists, worth adopting |

TODO Max: fill in the licences for the three paid ones. They are what a new
machine cannot get back on its own.

## Never launched on this machine

Spotlight has no use date for these. Decide once, then either remove them or
leave them alone knowingly.

| App | Cask available |
| --- | --- |
| Conductor | yes |
| Icon Composer | yes |
| SF Symbols | yes |
| Transmission | yes |
| Yate | yes |
| iTermAI | yes |
| Fallout 2 | no |
| Google Docs, Google Sheets, Google Slides | no, these are Chrome web app shortcuts |

## Settings that do not travel

Apps whose configuration follows no sync and is not worth versioning either.
Redo them by hand on a new machine.

| App | What to redo |
| --- | --- |
| Maccy | the invocation shortcut. No iCloud or CloudKit in its entitlements, verified |
| Rectangle | the window shortcuts |
| iTerm | profile and colours, `preferences/DarkSea.itermcolors` is a start |
| rekordbox | library and settings, and the library is irreplaceable |
| Infuse | library |

## Method, to repeat it later

```sh
# source of each app
test -e "/Applications/<app>.app/Contents/_MASReceipt" && echo "App Store"
brew list --cask

# real usage
mdls -name kMDItemLastUsedDate "/Applications/<app>.app"

# does a cask exist
grep -x "<token>" ~/Library/Caches/Homebrew/api/cask_names.txt
```

Deriving the token from the app name misses a lot: iTerm is `iterm2`, Docker is
`docker-desktop`, GitHub Desktop is `github`. Search the list rather than guess.
