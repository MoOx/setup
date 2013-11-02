# `$ fireinthehole`, it's that simple

<img alt="" align="right" src="https://raw.github.com/MoOx/dotfiles/master/backpack/i/kabooya.gif" />

(╯°□°）╯ ︵ 💥

Just run `fireinthehole` should setup the computer.
This includes:

- OS X configuration
- Development environment
- Apps
- Add some commands to the PATH

## First run

```
$ curl --silent https://raw.github.com/MoOx/dotfiles/master/backpack/firstrun | zsh
```

## Periodic run

```
$ fireinthehole
```

This command update the dotfiles themselve from the repo, then trigger `kaboom` which call every commands below.

<img alt="preview" align="right" src="https://raw.github.com/MoOx/dotfiles/master/backpack/i/fireinthehole.png" />

### Available commands

This commands should be available in your PATH & can be run independently.

- `apps` install all OS X native apps & pre-configure some
- `appstore` open the App Store
- `brewi` install Homebrew & specified packages
- `brewu` update brew
- `dotfiles` link dotfiles from `dotfilesception` folder (the smart way)
- `gemi` install specified gems
- `gemu` update gems (system & installed packages)
- `npmi` install specified node modules, globally
- `npmu` just an global npm update
- `osxdefaults` run lots of `defaults write`
- `snacktime` update brew, npm & gems
- `test-output` test output functions, not very usefull :) 

---

_Inspired by_

- https://github.com/holman/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/kud/my/


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/MoOx/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

