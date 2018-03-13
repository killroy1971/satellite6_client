#!/bin/sh
# This script will create subnets for the fisrt Satellite
# Organization, which has an Organization ID of 1.
# This script will use the first Satellite "capsule," which
# has a Capsule ID of 1, so the DHCP and TFTP server IDs
# are also 1.
# Glenn H. Snead - 26 Feb  2018

#Obtain variables
read -s -p "Enter the Satellite admin password:" SATPASS

# Primary Interface DHCP Subnet Options
DHCP_SUBNET="--organization-ids 1 --location-ids 1 --boot-mode static --ipam DHCP --dhcpd-id 1 --tftp_id 1"

# Non-Primary, Non-DHCP Subnet Options
NoDHCP_SUBNET="--organization-ids 1 --location-ids 1 --boot-mode static --ipam none"

# Define the Primary interface DHCP (and TFTP) using subnets here:
hammer --password ${SATPASS} subnet create --name tsc.org --mask 255.255.255.0 --gateway 192.168.4.1 --network 192.168.4.0 --from 192.168.4.50 --to 192.168.4.100 ${DHCP_SUBNET} 

# Define Non-Primary, Non-DHCP using subnets here:
hammer --password ${SATPASS} subnet create --name storage --mask 255.255.255.0 --network 192.168.10.0 ${NoDHCP_SUBNET} 

