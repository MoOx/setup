# `$ fireinthehole` (╯°□°）╯ ︵ 💥

<img alt="" align="right" src="https://raw.github.com/MoOx/dotfiles/master/backpack/i/kabooya.gif" />

Just run `fireinthehole`. It should setup the computer.
This includes:

- Commands & aliases for CLI
- OS X configuration
- Development environment
- OS native apps
- Configured preferences
- Whatever you want

## First run

```
$ curl --silent https://raw.github.com/MoOx/dotfiles/master/backpack/firstrun | zsh
```

## Periodic run

```
$ fireinthehole
```

This command should update this repository, then trigger `kaboom` which is the heart of this _dotfiles_
_Note: you will sometimes need to enter you password or some informations related to current installation_

This command launch like everything you define. If you have nothing special, it should take around 30s (mainly because of brew/gem update).
_This is done that way to ensure you are fully up to date with what you define here. Very concenient when I reopen my laptop (which occurs once in a month)._

### How it works ?

<img alt="preview" align="right" src="https://raw.github.com/MoOx/dotfiles/master/backpack/i/fireinthehole.png" />

Additionally to `fireinthehole` and `kaboom`, there is a lot of others commands available in each components.
This dotfiles, like [holman](https://github.com/holman/dotfiles#topical) ones, are built around topic areas.
Take a look to [components](components) to see available components.
_Note: some components may require other(s) (eg: `brew` component is used a lot :) )_

Most of the time, components contains a `setup` file that you can use in `kaboom`.

**[`kaboom`](bin/kaboom) mainly just run components `setup`.**

### Component

Here is what is automatically handled by this awesome [index.zsh](index.zsh) (inspired by [@holman](https://github.com/holman) work.

- _component_/***.zsh**: Any files ending in .zsh get loaded into your environment.
- _component_/**path.zsh**: Any file named `path.zsh` is _loaded first_ and is expected to setup $PATH or similar.
- _component_/**completion.zsh**: Any file named `completion.zsh` is _loaded last_ and is expected to setup autocomplete.
- _component_/**functions/**: component functions should be defined here.
- _component_/**setup**: component setup is done in this file.
- _component_/***.symlink**: Any files ending in `*.symlink` get symlinked into your $HOME (_prefixed by **.**). This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `$ dotfiles`.

**Note: to setup one component only, just run `$ setup {component_name}`**

### Symlinked dotfiles

The `dotfiles` command is pretty smart & will allow you to symlink you components files to `$HOME/.*`.
When you run this command it will ask you if there is already existing files (to avoid file lose).  
_Note that this command will not bother you for dotfiles alread symlinked._


## Inspired by

- https://github.com/holman/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/kud/my/
