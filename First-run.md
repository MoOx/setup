# (Re) Installing your OS, with a tool to prepare you machine.

When you setup a new machine, you can choose to configure your workspace "by hand", install all your prefered apps & software, setup preferences etcetera.
This can be a pain in the ass, especially if you have multiple machine to handle. I have 3 machines (desktop, laptop + one of my wife) & it's so boring to repeat each stuff on each machine.
You can use something like this war machin like I use to: [Boxen](http://boxen.github.com/), a tool based on [Puppet](https://puppetlabs.com/puppet/what-is-puppet/).
An alternative based on [Chef](http://www.opscode.com/chef/) also exist: [Pivotal Sprout](https://github.com/pivotal-sprout/sprout-wrap)).
But it's these solutions where overkill for me.

So I switch to simple shell scripts, using mainly zsh & `brew` (& `brew cask`) to handle software & apps (`apt-get` get like, for OS X).

---

## Backup

Save all your important file (some via BTSync, Dropbox, some on another HD).

@ todo list or script that folders copy (for BTSync)

### Save Bootcamp partition

I try a lot of stuff, but Bootcamp is just shit since it use a old trick for MBR bla bla.
So forget that, & loose all your Windows data. Or just save what you need by hand (I just run some games so...)

---

## OS Install

Make your OS clean install. Eventually use _Disk Utility_ to format for make a clean installation.
After that, you can open App Store & make OS update. And eventyally download Xcode and/or run

	xcode-select --install

This will ask you to install Command Line Tools. This can take some minutes, not an hour like with XCode.app.


## Dotfiles

See README.md, _First run_

## Dropbox Preferences

* [x] Use black and white menu bar icons


## BOOTCAMP (I mean dual boot with Windows)

Since I use more that 1 partition on my machine (OS/soft + data), I can't use Bootcamp (& btw, Bootcamp way to install Windows is based on old hybrid MBR stuff bla bla…)

I used to make a manual hybrid GPT/MBR table using [gdisk](http://www.rodsbooks.com/gdisk/hybrid.html), but it's past.
GPT is used by default on Mac, on since latest mac run EFI 2.x, we can natively install & boot into Windows (via UEFI) on a GPT disk.
You "just need" to create a bootable Windows UEFI device. [Read more about MBR, GPT, Mac & stuff]

### Create a bootable Windows UEFI USB

# todo
