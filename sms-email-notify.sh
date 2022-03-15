#Sends notification to email or phone when SSH login occurs.

#Assumes use of MSMTP, Dovecot for mail system, line 5 'sendmail' command can be adjusted for given system.

#For sending to phone simply use the email
#associated with phone number.

#for AT&T  it would be: phonenumber@txt.att.net for example.


if [ -n "$SSH_CLIENT" ]; then
    TEXT="$(date): ssh login to ${USER}@$(hostname -f)"
    TEXT="$TEXT from $(echo $SSH_CLIENT|awk '{print $1}')"
    echo $TEXT|sendmail "ssh login" emailaccount@example.com
fi
