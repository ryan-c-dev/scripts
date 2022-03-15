#!/bin/env bash
# using env is useful when Bash isn't located in /bin
#Cleanup, version 3

#Warning:
#-------
# This script uses quite a number of features that will be explained
#+ later on.
# By the time you've finished the first half of the book,
#+ there should be nothing mysterious about it.

LOG_DIR=/var/log
ROOT_UID=0	# Only useres with $UID 0 have root privileges.
LINES=50	# Default number of lines saved.
E_XCD=86	# Can't change directory?
E_NOTROOT=87	# Non-root exit error.

# Run as root, of course
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Must be root to run this script!!"
	exit $E_NOTROOT
fi

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
	lines=$1
else
	lines=$LINES # Default, if not specified on command-line.
fi

cd /var/log || {
	echo "Cannot change to necessary directory." >&2
	exit $E_XCD;
}

tail -n $lines messages > mesg.temp #save last section of message log file.
mv mesg.temp messages		    # Rename it as system log file.

# cat /dev/null > messages
#* No longer needed, as the above method is safer.

cat /dev/null > wtmp # ': > wtmp' and '> wtmp' have the same effect.
echo "Log files are cleaned up."
# Note that there are other log files in var/log not affected
#+ by this script.

exit 0
# A zero return value from the script upon exit indicates success
#+ to the shell.
