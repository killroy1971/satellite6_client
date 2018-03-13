#!/bin/sh
# This script will process exported repositories in
# /var/lib/pulp/katello-export for importing into
# a disconnected Satellite server
# Run this script in a screen or tmux session!
# Glenn H. Snead - 8 Feb 2018

#Enter katello-export
cd /var/lib/pulp/katello-export

#Generate directory listing
DIRLIST=`find ./ -type d -name "content"`
DIRLIST2=`find ./ -type d -name "custom"`

#Make sure katello-export/content exists
if [ ! -d /var/lib/pulp/katello-export/content ]; then mkdir /var/lib/pulp/katello-export/content; fi

#Process 'custom' directories, placing them into the contnet directory
for i in ${DIRLIST2}; do
  if [ ${i} != "./custom" ]; then
    pushd ${i} 1>/dev/null
    rsync -av ./ /var/lib/pulp/katello-export/content/
    popd 1>/dev/null
    #Remove the just processed directory unless the directory's name is content
    if [ ${i} != "./content" ]; then /bin/rm -rf ${i}; fi
  fi
done

#Process directories, placing them into the contnet directory
for i in ${DIRLIST}; do
  if [ ${i} != "./content" ]; then
    pushd ${i} 1>/dev/null
    rsync -av ./ /var/lib/pulp/katello-export/content/
    popd 1>/dev/null
    #Remove the just processed directory unless the directory's name is content
    if [ ${i} != "./content" ]; then /bin/rm -rf ${i}; fi
  fi
done

#Clean up the now empty export directories
DIRLIST=`ls -l | awk '{print $9}'`
for i in ${DIRLIST}; do
  if [ ${i} != "content" ]; then rm -rf ${i}; fi
done

