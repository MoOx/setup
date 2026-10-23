# Applications

What the `Brewfile` cannot reinstall on its own, and why.

Run `bin/apps` for the current state; this file only holds what a command cannot
work out by itself.

## Reinstall by hand

| App | Where it comes from |
| --- | --- |
| JPEGmini Pro | paid, vendor download |
| The Tagger | paid, vendor download |
| AzireVPN | vendor download |
| FAZUA Toolbox | FAZUA, bike drive utility |

## Not quite a cask

| App | What to do |
| --- | --- |
| Nicotine+ | `nicotine-plus` exists as a **formula**, not a cask, so it cannot adopt the standalone `.app`. Either keep the app and reinstall it by hand, or switch to the formula and drop the app |
| iTermAI | ships with iTerm, nothing of its own to install |

## Settings that do not travel

No sync, and not worth versioning either. Redo them by hand.

| App | What to redo |
| --- | --- |
| Maccy | the invocation shortcut. No iCloud or CloudKit in its entitlements, verified |
| Rectangle | the window shortcuts |
| iTerm | profile and colours, `preferences/DarkSea.itermcolors` is a start |
| rekordbox | library and settings, and the library is irreplaceable |
| Infuse | library |

## Deliberately not listed

- **Apps that ship with macOS**, Safari first among them.
- **Xcode**, which comes from the App Store. Note that `xcode-select --install`
  installs **only the Command Line Tools**, a couple of gigabytes of compiler,
  git and headers. Xcode itself is a separate install an order of magnitude
  bigger, and `xcodes` in the `Brewfile` is there to manage its versions.
- **Beta builds sitting next to a stable one**, such as SF Symbols Beta.
- **Vendor utilities tied to a device**, such as LG Switch.
- Games.

## A trap in the usage dates

`bin/apps` reads `kMDItemLastUsedDate`, and an app that an updater has replaced
looks **never launched**, because the date belongs to the bundle and the bundle
is new. SF Symbols, Transmission and Yate all showed `never` for that reason,
having been updated by Pearcleaner and not opened since.

So `never` means "worth asking about", not "unused". Only its owner can tell
the difference.
