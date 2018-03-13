#!/bin/sh
# This script will create host collections for the 
# default Organization, which has an Organization ID of 1
# Glenn H. Snead - 19 Feb 2018

# To use this script. create copies of these lines to represent
# the desired server groupings.

#Obtain variables
read -s -p "Enter the Satellite admin password: " SATPASS

# Create the RHEL7_defualt host collection
hammer --password ${SATPASS} host-collection create --organization-id 1 --location-ids 1 --name "RHEL7_default" 

# Create the RHEL6_default host collection
hammer --password ${SATPASS} host-collection create --organization-id 1 --location-ids 1 --name "RHEL6_default" 

