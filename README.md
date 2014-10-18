# MoOx `dotfiles`

> When dotfiles go crazy.

<img alt="" align="right" src="https://rawgit.com/MoOx/dotfiles/master/.kaboom.gif" />

Just run `fireinthehole`. It should setup the computer.

- Commands & aliases for CLI
- OS configuration
- Development environment
- Packages & OS native apps
- Configured preferences for everything (OS, apps)
- Whatever you have defined (see [component](#component-definition) definition)

## First run

```bash
$ curl -fsSL https://raw.github.com/MoOx/dotfiles/master/firstrun | zsh
```

## Commands & aliases

### `$ fireinthehole`

This command should update this repository, then trigger `kaboom` (which is the heart of this _dotfiles_).
_Note: you will sometimes need to enter you password or some informations related to current installation_.

This command launch like everything you define. If you have nothing special, it should take around 30s (mainly because of brew/npm/gem updates).

_This is done that way to ensure you are fully up to date with what you define here. Very concenient when I reopen my laptop (which occurs once or twice in a month) to sync everythings, includings new apps, alias, preferences, packages...._

Here is an example of the output

```
~  
❯ fireinthehole

(╯°□°）╯ ︵ 💥

Password:
❯ Updating from remote ...
From https://github.com/MoOx/dotfiles
 * branch            master     -> FETCH_HEAD
Already up-to-date.
❯ Installing/Updating dotfiles ...
❯ Updating Homebrew (brew) ...
Already up-to-date.
❯ Defining OS X options
❯ Installing/Updating NPM global packages ...
❯ Updating LimeChat theme ...
Already up-to-date.
❯ Installing/Updating Gems ...
❯ Updating Dock ...

~  
❯
```

### `$ .f`

Open your dotfiles using `open` command (eg: on OS X, Finder.app).

### `$ e [file]`

Open a file/directory in your [configured editor](components/editor/editor.zsh).
If you don't provide an argument, this will open the current folder.


### `$ .fe`

Open your dotfiles in [your configured editor](components/editor/editor.zsh).

### `$ .symlinks`

Link all `*.symlink` files into your `~/`.
When you run this command it will ask you if there is already existing files (to avoid file lose).  
_Note that this command will not bother you for dotfiles alread symlinked._

### `$ .submodules-add {name} {git://...}`

Add a submodule under your dotfiles submodule path

### `$ .submodules-update`

Update & commit updated submodules

### `$ appstore`

Open the AppStore (at least on OS X).

### `$ fuckosx`

Reload OSX Finder, Dock, Menubar & Notification Center. There is also `fuckosxprefs`, `fuckosxfinder` && `fuckosxdock`.

### `$ list`

List all aliases & functions (except _*). You should try that. Just mix `list-aliases` & `list-functions`.

_Obviously you will get a long list ;)_

### `$ search {query}`

List all aliases & functions (except _*) that will match the query (it's a `list | grep` alias)

---

## How it works ?

Additionally to `fireinthehole` and `kaboom`, there is a lot of others commands available in each components.
This dotfiles, like [holman](https://github.com/holman/dotfiles#topical) ones, are built around topic areas.
Take a look to [components](components) to see available components.
_Note: some components may require other(s) (eg: `brew` component is used a lot :) )_

Most of the time, components contains a `setup` file that you can use in `kaboom`.

**[`kaboom`](bin/kaboom) mainly just run components `setup` in the predefined order.**

## Component definition

Here is what is automatically handled by this awesome [index.zsh](index.zsh) (inspired by [@holman](https://github.com/holman) work).

- `component/*.zsh`: Any files ending in .zsh get loaded into your environment.
- `component/path.zsh`: Any file named `path.zsh` is _loaded first_ and is expected to setup $PATH or similar.
- `component/completion.zsh`: Any file named `completion.zsh` is _loaded last_ and is expected to setup autocomplete.
- `component/functions/`: component functions should be defined here.
- `component/setup`: component setup is done in this file.
- `component/*.symlink`: Any files ending in `*.symlink` get symlinked into your $HOME (_prefixed by `.`_). This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `$ .symlinks`.
- `component/README.md`: Please provide doc for each components.

**Note: to setup one component only, just run `$ setup {component_name}`**

---

## I'm not familiar with bash/zsh, is there any interesting tutorial you can share ?

[linuxconfig.org/bash-scripting-tutorial](http://linuxconfig.org/bash-scripting-tutorial) is a nice one.


## Find more `defaults write`

http://superuser.com/questions/455755/how-to-explore-more-defaults-write-tweaks-on-os-x

For most non-hidden settings, this is how you can find the correct preference keys in Terminal.app:

	defaults read > a
	# Change the setting
	defaults read > b
	diff a b

For hidden settings, it gets trickier. You can use the command-line strings utility
on any binary executable and see if any of the resulting text looks like a preference key.
E.g.:

	strings /System/Library/CoreServices/Finder.app/Contents/MacOS/Finder

Here’s another example that will look through all .framework files in /System/Library/Frameworks/
and filter the output somewhat:

	strings /System/Library/Frameworks/*.framework/Versions/Current/* /System/Library/Frameworks/*/Frameworks/*/Versions/Current/* 2> /dev/null | grep -E '^[a-zA-Z0-9_.-]{10,80}$' | sort | uniq

There’s also a tool called GDB which can be used to find hidden preferences.

---

## Inspired by

- https://github.com/holman/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/kud/my/
