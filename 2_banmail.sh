#!/bin/sh

mail="$(grep "^From:" /dev/stdin | grep -o "[^<> ]\+@.\+\\.[^<>]\+")"

# If the argument "all" is given to this command, ban ALL addresses from this domain.
if [ "$1" = "all" ]; then
	domain="$(echo "$mail" | cut -d@ -f2)"
	echo "Really ban entire $domain domain? [y/N]"
	read -r choice </dev/tty
	echo "$choice" | grep -i "^y$" &&
		eval "ssh rc 'echo blacklist_from $domain >> /etc/spamassassin/local.cf;systemctl reload spamassassin &'"

else
	echo Ban only mail address.
	echo "Really ban $mail? [y/N]"
	read -r choice </dev/tty
	echo "$choice" | grep -i "^y$" &&
		eval "ssh rc 'echo blacklist_from $mail >> /etc/spamassassin/local.cf;systemctl reload spamassassin &'"
fi
