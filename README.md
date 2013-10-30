# `$ fireinthehole`, it's that simple

<img alt="" align="right" src="http://25.media.tumblr.com/18d3313bf26f87bd14212087de1cf18f/tumblr_mtp2dqsu4p1rjorvbo1_250.gif" />

(╯°□°）╯ ︵ 💥

Just run `fireinthehole` should setup the computer.
This includes:

- OS X configuration
- Development environment
- Apps
- Add some commands to the PATH

## First run

```shell
$ curl --silent https://raw.github.com/MoOx/dotfiles/master/backpack/firstrun | zsh
```

## Periodic run

```shell
$ fireinthehole
```

### Available commands

- `apps` install OS X native apps
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

---

_Inspired by_

- https://github.com/holman/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/necolas/dotfiles
- https://github.com/kud/my/


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/MoOx/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

