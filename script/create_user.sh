#!/bin/bash
# setup dev user
useradd -s /bin/bash -d /var/www -m -G docker jetxdev
usermod -g docker jetxdev
# copy missing profile file
cp -r /etc/skel/. /var/www
mkdir -p /var/www/logs
chown -R jetxdev:docker /var/www
find /var/www -type d -exec chmod 775 {} \;
find /var/www -type f -exec chmod 664 {} \;
su jetxdev bash -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
chown jetxdev:jetxdev /var/www
chmod 0755 /var/www
cp /root/.ssh/authorized_keys /var/www/.ssh/authorized_keys
chown -R jetxdev:jetxdev /var/www/.ssh
chmod 0700 /var/www/.ssh
chmod 0600 /var/www/.ssh/authorized_keys
umask 002 /var/www;