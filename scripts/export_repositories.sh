#!/bin/sh
# This script will export a repository list.  
# This script assumes the Organization ID is 1, 
# Glenn H. Snead - 8 Feb 2018

#Obtain variables
read -s -p "Enter the Satellite admin password: " SATPASS
read -s -p "Do you want a full export or an incremental export? (Y/N): " CHOICE
if [ ${CHOICE} == "N" ]; then read -s -p "Enter the export start date (YYYY-MM-DD): " SINCEDATE; fi

# Generate repository ID list
REPOLIST=`hammer --password ${SATPASS} repository list --organization-id 1 | awk -F\| '{ print $1 }' | sed -e '/^-/d' | sed -e '/^ID/d'

# Export all Satellite Organization ID 1 repositories

for i in ${REPOLIST}; do
  if [ ${CHOICE} == "N" ]; then
    hammer --password ${SATPASS} repository export --organization-id 1 --id ${i}
  else
    hammer --password ${SATPASS} repository export --organization-id 1 --id ${i} --since ${SINCEDATE}
  fi
done

