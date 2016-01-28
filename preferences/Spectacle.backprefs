#!/usr/bin/env zsh

# Usage: ./setup/preferences/Spectacle.backprefs
# Will create ./setup/preferences/Spectacle.prefs

SPECTACLE_PREFS="$(dirname $0)/Spectacle.prefs"

echo "#!/usr/bin/env zsh\n" > $SPECTACLE_PREFS
echo "defaults write com.divisiblebyzero.Spectacle SUEnableAutomaticChecks -bool true\n" >> $SPECTACLE_PREFS
# https://github.com/mathiasbynens/dotfiles/issues/507#issuecomment-93173783
for key in \
  MoveToCenter \
  MoveToFullscreen \
  \
  MoveToLeftHalf \
  MoveToRightHalf \
  MoveToTopHalf \
  MoveToBottomHalf \
  \
  MoveToUpperLeft \
  MoveToLowerLeft \
  MoveToUpperRight \
  MoveToLowerRight \
  \
  MoveToPreviousDisplay \
  MoveToNextDisplay \
  \
  MoveToPreviousThird \
  MoveToNextThird \
  \
  MakeLarger \
  MakeSmaller \
  \
  RedoLastMove \
  UndoLastMove
do
  printf "defaults write com.divisiblebyzero.Spectacle ${key} -data " >> $SPECTACLE_PREFS
  defaults read com.divisiblebyzero.Spectacle ${key} | sed 's/[^0-9a-f]//g' >> $SPECTACLE_PREFS
done
