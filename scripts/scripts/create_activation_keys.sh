#!/bin/sh
# This script will create activation keys for the 
# default Organization, which has an Organization ID of 1
# All actctivation keys are assigned to the "Winter" 
# Lifecycle Environmnet
# Glenn H. Snead - 8 Feb 2018

# To use this script. you will need the following:
# Subscription ID numbers: Use the list_subscription_ids.sh script
# Use the subscription id numbers in the "Add subscriptions" sections

#Obtain variables
read -s -p "Enter the Satellite admin password: " SATPASS

ENVIRONMENT="Winter"

#Create RHEL7_default Activaiton Key
# Create the activation key
hammer --password ${SATPASS} activation-key create --organization-id 1 --name "RHEL7_default" --content-view "RHEL7_default" --lifecycle-environment ${ENVIRONMENT}

#Add subscriptions
hammer --password ${SATPASS} activation-key add-subscription --organization-id 1 --name "RHEL7_default" --subscription-id <ID>

#Enable repositories by default
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_default" --value 1 --content-label rhel-7-server-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_default" --value 1 --content-label rhel-7-server-satellite-tools-6.2-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_default" --value 1 --content-label rhel-7-server-rh-common-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_default" --value 1 --content-label rhel-7-server-optional-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_default" --value 1 --content-label rhel-7-server-supplementary-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_default" --value 1 --content-label rhel-7-server-extras-rpms

#Create RHEL6_default Activaiton Key
# Create the activation key
hammer --password ${SATPASS} activation-key create --organization-id 1 --name "RHEL6_default" --content-view "RHEL6_default" --lifecycle-environment ${ENVIRONMENT}

#Add subscriptions
hammer --password ${SATPASS} activation-key add-subscription --organization-id 1 --name "RHEL6_default" --subscription-id <ID>

#Enable repositories by default
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL6_default" --value 1 --content-label rhel-6-server-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL6_default" --value 1 --content-label rhel-6-server-satellite-tools-6.2-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL6_default" --value 1 --content-label rhel-6-server-rh-common-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL6_default" --value 1 --content-label rhel-6-server-optional-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL6_default" --value 1 --content-label rhel-6-server-supplementary-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL6_default" --value 1 --content-label rhel-6-server-extras-rpms

#Create RHEL7_Satellite_6.2 Activaiton Key
# Create the activation key
hammer --password ${SATPASS} activation-key create --organization-id 1 --name "RHEL7_Satellite_6.2" --content-view "RHEL7_Satellite_6.2" --lifecycle-environment ${ENVIRONMENT}

#Add subscriptions
hammer --password ${SATPASS} activation-key add-subscription --organization-id 1 --name "RHEL7_Satellite_6.2" --subscription-id <ID>

#Enable repositories by default
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_Satellite_6.2" --value 1 --content-label rhel-7-server-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_Satellite_6.2" --value 1 --content-label rhel-server-rhscl-7-rpms
hammer --password ${SATPASS} activation-key content-override --organization-id 1 --name "RHEL7_Satellite_6.2" --value 1 --content-label rhel-7-server-satellite-6.2-rpms

