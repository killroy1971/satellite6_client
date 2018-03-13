#!/bin/sh
# This script will create content views for the 
# default Organization, which has an Organization ID of 1
# Glenn H. Snead - 8 Feb 2018

# To use this script. you will need repositories names.
# Use the list_repositories.sh script to obtain
# the repositories names.
# Repository names are used here as each Satellite server
# will generate different repositories IDs.  The names are
# consistent.

#Obtain variables
read -s -p "Enter the Satellite admin password: " SATPASS

# Create the RHEL7_defualt content view
hammer --password ${SATPASS} content-view create --organization-id 1 --name "RHEL7_default" --product "Red Hat Enterprise Linux Server" --repositories "Red Hat Enterprise Linux 7 Server RPMs x86_64 7Server"

#Add repositories
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 7 Server - RH Common RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Satellite Tools 6.2 for RHEL 7 Server RPMs x86_64"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 7 Server - Optional RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 7 Server - Supplementary RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 7 Server - Extras RPMs x86_64"


# Create the RHEL6_defualt content view
hammer --password ${SATPASS} content-view create --organization-id 1 --name "RHEL6_default" --product "Red Hat Enterprise Linux Server" --repositories "Red Hat Enterprise Linux 6 Server RPMs x86_64 7Server"

#Add repositories
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL6_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 6 Server - RH Common RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL6_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Satellite Tools 6.2 for RHEL 6 Server RPMs x86_64"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL6_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 6 Server - Optional RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL6_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 6 Server - Supplementary RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL6_default" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 6 Server - Extras RPMs x86_64"


#Create RHEL7_Satellite_6.2 content view
hammer --password ${SATPASS} content-view create --organization-id 1 --name "RHEL7_Satellite_6.2" --product "Red Hat Enterprise Linux Server" --repositories "Red Hat Enterprise Linux 7 Server RPMs x86_64 7Server"

#Add repositories
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_Satellite_6.2" --product "Red Hat Enterprise Linux Server" --repository "Red Hat Enterprise Linux 7 Server - RH Common RPMs x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_Satellite_6.2" --product "Red Hat Software Collections for RHEL Server" --repository "Red Hat Software Collections RPMs for Red Hat Enterprise Linux 7 Server x86_64 7Server"
hammer --password ${SATPASS} content-view add-repository --organization-id 1 --name "RHEL7_Satellite_6.2" --product "Red Hat Satellite" --repository "Red Hat Satellite 6.2 for RHEL 7 Server RPMs x86_64"

