#!/bin/sh
# This script will register a client to Satellite 6
# Using the required activation keys.
# Glenn H. Snead - 27 Feb 2018

#Katello Consumer Package URL
KATELLO_CONSUMER_URL="http://satellite.example.com/pub/katello-ca-consumer-latest.noarch.rpm"

#Actication Key Names
RHEL_7_VMWARE="rhel7_vmware_key"
RHEL_7_PHYSICAL="rhel7_physical_key"
JBOSS_ACTIVATION_KEY="jboss_key"
SATELLITE_ACTIVATION_KEY="satellite_key"
RHEL7_CUSTOM_KEY='rhel7_custom"

# Stop RHSM service
# Obtain Red Hat Major Release Version
RHVER=`awk '{print $7}' /etc/redhat-release | awk -F. '{print $1}'`
case ${RHVER} in
  6)
    service rhnsd stop
    ;;
  7)
    systemctl stop rhnsd
    ;;
esac

# Copy activation id key to root
cp /etc/sysconfig/rhn/systemid /root/systemid
rm -f /etc/sysconfig/rhn/systemid

# Install Satellite Katello Consumer Key
yum -y localinstall ${KATELLO_CONSUMER_URL}

# Subscribe server using listed activation keys
# This has not been tested
subscription-manager register --org="FBI" --activationkey=${RHEL_7_VMWARE} --activationkey=${RHEL7_CUSTOM_KEY} 

# If subscription was successful, disable the rhsd service
if [ $? == 0 ]; then
  case ${RHVER} in
    6)
      chkconfig rhnsd off
      ;;
    7)
      systemctl disable rhnsd
      ;;
  esac
  sed -i -e 's/enabled = 1/enabled = 0/g' /etc/yum/pluginconf.d/rhnplugin.conf
else
  case ${RHVER} in
    6)
      mv /root/systemid /etc/sysconfig/rhn/systemid
      rm -f /etc/rhsm/rhsm.conf
      mv /etc/rhsm/rhsm.conf.kat-backup /etc/rhsm/rhsm.conf
      service rhnsd start
      ;;
    7)
      mv /root/systemid /etc/sysconfig/rhn/systemid
      rm -f /etc/rhsm/rhsm.conf
      mv /etc/rhsm/rhsm.conf.kat-backup /etc/rhsm/rhsm.conf
      systemctl start rhnsd
      ;;
  esac
fi

