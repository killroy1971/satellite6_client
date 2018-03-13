#!/bin/sh
# This script will create custom products and an 
# acompanying repository in the first Satellite 
# Organization, which has an Organization ID of 1.
# Glenn H. Snead - 8 Feb 2018

# To use: set the GPGKEY variable below.
# Edit the TSC custom products 
# and custom repositories sections

#Obtain variables
#GPGKEY="<GPG-KEY-NAME>"
read -s -p "Enter the Satellite admin password: " SATPASS

# Create the Puppet product and repository
# No url.  The puppet repository type does not use the url setting
hammer --password ${SATPASS} product create --name "puppet" --description "Puppet Modules" --organization-id 1
hammer --password ${SATPASS} repository create --organization-id 1 --content-type puppet --mirror-on-sync false --checksum-type sha256 --name "puppet-modules" --product "puppet"

# Create TSC custom products
hammer --password ${SATPASS} product create --name "RHEL7_BigMatch" --description "RHEL 7 Server BigMatch" --organization-id 1
hammer --password ${SATPASS} product create --name "RHEL6_BigMatch" --description "RHEL 6 Server BigMatch" --organization-id 1

# Create TSC custom repositories
hammer --password ${SATPASS} repository create --organization-id 1 --content-type yum --mirror-on-sync false --checksum-type sha256 --name "rhel-7-bigmatch" --product "RHEL7_BigMatch" --url http://$(hostname)/pub/content/rhel-7-bigmatch 
hammer --password ${SATPASS} repository create --organization-id 1 --content-type yum --mirror-on-sync false --checksum-type sha256 --name "rhel-6-bigmatch" --product "RHEL6_BigMatch" --url http://$(hostname)/pub/content/rhel-6-bigmatch --gpg-key ${GPGKEY}


