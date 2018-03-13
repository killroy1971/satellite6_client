<%#
kind: snippet
name: rhev_client
%>
log_level: info

<%#
# This snippet will install, enable, and start the rhev/ovirt guest package.
%>

# Enable rhel-6-server-rhv-4-agent-rpms
<% if @host.operatingsystem.major.to_i == 6 %>
  /usr/sbin/subscription-manager repos --enable=rhel-6-server-rhv-4-agent-rpms
<% end -%>

# Install the rhev/ovirt guest package
/usr/bin/yum -y install rhevm-guest-agent-common

#Enable rhev/ovirt guest agent service
<% if @host.operatingsystem.major.to_i < 7 %>
  /sbin/chkconfig ovirt-guest-agent on
<% else %>
  /bin/systemctl enable ovirt-guest-agent.service
<% end -%>

#Start the rhev/ovirt guest agent service
<% if @host.operatingsystem.major.to_i < 7 %>
  /sbin/service ovirt-guest-agent start
<% else %>
  /bin/systemctl start ovirt-guest-agent.service
<% end -%>

