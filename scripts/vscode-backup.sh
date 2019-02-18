#!/usr/bin/env zsh

ext=$(code --list-extensions | xargs -L 1 echo code --install-extension)

echo "#!/usr/bin/env zsh\n$ext" > vscode.extensions.sh
