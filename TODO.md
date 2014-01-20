# TODO

- Finish First-run.md
- Move packages list as external files (osx apps, node/gems/brew packages...)
- Dl & install Sublime Package
- Themes (iterm, limechat, ...)
- IE VMs

		curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | INSTALL_PATH="$HD/Users/MoOx/VMs/ievms" IEVMS_VERSIONS="6 9" bash

`/!\` Eventually install & configure a software like [Synergy](http://synergy-foss.org/download/?list) to be able to control/configure the fresh OS while you are working on another one.


- network sharing
- configure ssh access + change port
- update default Contacts.app template
- configure opendns

- Desktop
  - Customize wallpaper
- Language & Text
  - Edit list as needed
- Spotlight
  - Search Results: Edit list as needed
  - Privacy: Edit list (add others hard drive ?)
- Energy Saver
  - Adapt as you want
- Mouse
  - If you use a mouse : Uncheck "Move content in the direction of finger…"
- Mail, Contacts & Calendars
  - Add your accounts
- Sharing
  - Think to share some files :)

- Sidebar
   - uncheck All my files and iDisk
  - check your computer
- Remove icons you don't want into menu bar by command+click on them and move away

### Activate remote login (for personal use or emergency like thief)

On OS X
Start by changing default SSH port

	subl /private/etc/services

Add your own port

	ssh2             22222/udp  # SSH Remote Login Protocol
	ssh2             22222/tcp  # SSH Remote Login Protocol

Edit

	subl /System/Library/LaunchDaemons/ssh.plist

& Change

	<key>SockServiceName</key>
	<string>ssh2</string>

### [Local mail with postfix relay](http://stevelorek.com/configure-postfix-relay-gmail-osx-lion.html)

### Git(hub) Configuration

[Token info](https://help.github.com/articles/creating-an-oauth-token-for-command-line-use)

	curl -u 'MoOx' -d '{"note":"Update token"}' https://api.github.com/authorizations

Copy your token from the token field & paste your token into ~/.github_token (`echo TOKEN > ./.github_token`), then

	git config --global user.name "Maxime Thirouin"
	git config --global user.email m@moox.io
	git config --global github.user MoOx
	git config --global github.token $(cat ~/.github_token)

#### [Github SSH Key](https://help.github.com/articles/generating-ssh-keys)

	cd ~/.ssh
	mkdir key_backup
	cp id_rsa* key_backup
	rm id_rsa*
	ssh-keygen -t rsa -C "m@moox.io"
	pbcopy < ~/.ssh/id_rsa.pub

[Paste clipboard content as a new key on your Github account settings](https://github.com/settings/ssh)


## First run some apps

Run apps you want to open during startup & activate that option in _Preferences_.

	

## Setup Internet Accounts

System Preferences > Internet Accounts

### If you have a good Twitter client with notifications

Remove duplicate OS X notifications: System Preferences > Notifications Center > Remove Twitter from center & choose "None" for alert style.


## Setup MenuMeters

System Preferences > MenuMeters

### Setup n64 emulator with high resolution textures

#### With Mupen64Plus

	ln -s ~/Dropbox/Games/n64/hires_textures ~/.local/share/mupen64plus/hires_texture

#### With wine
	brew install wine
	wine ~/Dropbox/Games/n64/project64_1.6.exe
	wine ~/Dropbox/Games/n64/RiceVideoSetup.exe
	ln -s ~/Dropbox/Games/n64/hires_textures ~/.wine/drive_c/Program\ Files/Project64\ 1.6/Plugin"
	wine ~/.wine/drive_c/Program\ Files/Project64\ 1.6/Project64.exe

#### With CrossOver

	# install crossover & project64 then
	ln -s ~/Dropbox/Games/n64/hires_textures ~/Library/Application\ Support/CrossOver/Bottles/project64_1.6.exe/drive_c/Program\ Files/Project64\ 1.6/Plugin
