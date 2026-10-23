-- Setup.app: the clickable half of the weekly check.
--
-- Clicking a notification activates the application that posted it, and that
-- is the only thing that gives a notification a click target. A notification
-- posted by osascript belongs to Script Editor, so clicking it leads nowhere.
--
-- So this app has two jobs, told apart by a flag file and nothing else:
--   the flag file is there  ->  read it, post the notification, quit
--   the flag file is gone   ->  this is a click, open the repository
--
-- bin/weekly-check writes the summary into the flag file and launches this
-- app. The click that follows launches it again, this time with no flag file.
-- Dispatching on a file rather than on launch arguments keeps it testable: the
-- flag file disappearing is the proof that the app ran.
--
-- A template. `setup agent` writes the real paths in and compiles it with
-- osacompile, which ships with macOS.

property flagFile : "__FLAG__"
property openCommand : "__COMMAND__"

on run
	dispatch()
end run

-- Clicking a notification sends reopen when the app happens to still be
-- running, and run when it is not. Both land in the same place.
on reopen
	dispatch()
end reopen

on dispatch()
	if hasFlag() then
		set summary to do shell script "cat " & quoted form of flagFile
		do shell script "rm -f " & quoted form of flagFile
		display notification summary with title "Setup"
	else
		do shell script "open " & quoted form of openCommand
	end if
end dispatch

on hasFlag()
	try
		do shell script "test -s " & quoted form of flagFile
		return true
	on error
		return false
	end try
end hasFlag
