#!/bin/sh
# This script will list the subscriptions for the fisrt Satellite
# Organization, which has an Organization ID of 1.
# Glenn H. Snead - 8 Feb 2018

#Obtain variables
read -s -p "Enter the Satellite admin password:" SATPASS

hammer --password ${SATPASS} subscription list --organization-id 1

