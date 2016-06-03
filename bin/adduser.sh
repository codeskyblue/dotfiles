#!/bin/bash -
#

if test $# -ne 1
then
	echo "Usage: $0 <username>"
	exit 1
fi

USER=$1
echo "Paste public key here"
read PUBKEY

set -eu
yes | sudo adduser --disabled-password -c "auto created by adduser.sh" --shell /bin/bash "$USER"
sudo -u $USER ssh-keygen -t rsa -N "" -f /home/$USER/.ssh/id_rsa
sudo -u $USER bash -c "echo $PUBKEY > /home/$USER/.ssh/authorized_keys"

echo "User $USER created."
echo "-------------------"
echo "Protocol: ssh"
echo "Host: $(hostname -i)"
echo "Port: 32200"
echo "User: $USER"

