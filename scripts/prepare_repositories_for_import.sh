#!/bin/sh
# This script will process directories in /var/www/html/pub/content
# for importing into a disconnected Satellite server
# Run this script in a screen or tmux session!
# Glenn H. Snead - 8 Feb 2018

#Make sure pub/content exists
if [ ! -d /var/www/hmtl/pub/content ]; then 
  echo "Directory /var/www/html/pub/content does not exist!  Exiting"
  exit 1
fi

# Set file and directory ownership
chmod -R apache:apache /var/www/html/pub/content/

# Set directory ownership
find /var/www/html/pub/content -type d exec chmod 0755 {} +
find /var/www/html/pub/content -type f exec chmod 0644 {} +

# Restore SELinux file lables
restorecon -Rv /var/www/html/pub/content/

