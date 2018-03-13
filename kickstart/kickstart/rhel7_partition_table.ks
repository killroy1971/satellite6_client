<%#
kind: ptable
name: RHEL 7 STIG compliant Satellite 6 partition script
# Adjust partition sizes as necessary
oses:
- RedHat 7
%>

# Partition clearing information
zerombr
clearpart --all --initlabel

# System bootloader configuration
bootloader --location=mbr --append="biosdevname=0 net.ifnames=0" --boot-drive=sda

# Disk partitioning information
part /boot --fstype="ext4" --ondisk=sda --size=500
part pv.20 --fstype="lvmpv" --ondisk=sda --size=4096 --grow
volgroup vg01 pv.20
logvol /  --fstype="ext4" --size=1024 --name=root --vgname=vg01
logvol /usr  --fstype="ext4" --size=5120 --name=usr --vgname=vg01
logvol /opt  --fstype="ext4" --size=5120  --name=opt --vgname=vg01
logvol /var  --fstype="ext4" --size=5120 --name=var --vgname=vg01
logvol /var/log  --fstype="ext4" --size=5120 --name=var_log --vgname=vg01
logvol /home  --fstype="ext4" --size=2048 --name=home --vgname=vg01
logvol /tmp  --fstype="ext4" --size=5120  --name=tmp --vgname=vg01 --fsoptions=defaults,noexec
logvol swap  --fstype="swap" --size=2048 --name=swap --vgname=vg01

