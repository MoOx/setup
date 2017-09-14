# MoOx `setup`

> Dotfiles, aliases, functions, preferences, apps. Everything.

---

<a target='_blank' rel='nofollow' href='https://app.codesponsor.io/link/6RNUx3a3Vj2k5iApeppsc9L9/MoOx/setup'>  <img alt='Sponsor' width='888' height='68' src='https://app.codesponsor.io/embed/6RNUx3a3Vj2k5iApeppsc9L9/MoOx/setup.svg' /></a>

---

### First run

```console
$ curl -fsSL https://raw.githubusercontent.com/MoOx/setup/master/setupsh/firstrun | zsh -s MoOx/setup
```

The first run can take a couple of hours since this will download lot of apps. But you will be able to use your minimal dev environnement in a couple of minutes (dotfiles, text editor etc).
You might need some human interactions to configure some part.

#### Computer name

```console
COMPUTER_NAME="MaxBook"
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
```

### Update & run

```console
$ fliptable
```

Update is pretty fast: it get latest update from remote and update some packages.

![kaboom](https://raw.githubusercontent.com/MoOx/setup/master/.kaboom.gif)

---

**Based on [setupsh](https://github.com/MoOx/setupsh)** _(for now in [./setupsh](setupsh),  wip)._
