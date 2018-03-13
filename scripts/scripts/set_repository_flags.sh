#!/bin/sh
# This script will ensure the fisrt Satellite
# Organization's repositories, which has an Organization ID of 1, 
# have the Mirror on Sync flag set to false.
# Glenn H. Snead - 8 Feb 2018

#Obtain variables
read -s -p "Enter the Satellite admin password: " SATPASS

# Generate repository list
REPOLIST=`hammer --password ${SATPASS} repository list --organization-id 1 | awk -F\| '{ print $1 }' | sed -e '/^-/d' | sed -e '/^ID/d'`

# Set mirror-on-sync to false
for i in ${REPOLIST}; do
  hammer --password ${SATPASS} repository update --organization-id 1 --id ${i} --mirror-on-sync false
done

