#!/bin/sh

#work in progress, shall utilize AWK instead of GREP for better efficiency

#for use with Dovecot, Postfix,SpamAssassin, and works with bindkeys in Neomutt mail client.

mail="$(grep "^From:" /dev/stdin | grep -o "[^<> ]\+@.\+\\.[^<>]\+")" && break

# Give an argument to this command to ban ALL addresses from this domain.
if [ -n "$1" ]; then
	domain="$(echo $mail | cut -d@ -f2)"
	echo "Really ban entire $domain domain? [y/N]"
	read -r choice </dev/tty
	echo "$choice" | grep -i "^y$" &&
		eval "ssh rc 'echo blacklist_from $domain >> /etc/spamassassin/local.cf;systemctl reload spamassassin &'"

else
	echo Ban only mail address.
	echo "Really ban $mail? [y\N]"
	read -r choice </dev/tty
	echo $choice | grep -i "^y$" &&
		eval "ssh rc 'echo blacklist_from $mail >> /etc/spamassassin/local.cf;systemctl reload spamassassin &'"
fi
