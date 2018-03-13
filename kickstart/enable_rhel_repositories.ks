<%#
kind: snippet
name: enable_rhel_repositories
-%>
<%# 
  This kickstart snippet enables the RHEL 6/7 optional, extras, supplemental, and common RHEL repositories. 
%>

<% if @host.operatingsystem.major.to_i == 7 %>
subscription-manager repos --enable=rhel-7-server-extras-rpms
subscription-manager repos --enable=rhel-7-server-optional-rpms
subscription-manager repos --enable=rhel-7-server-supplemental-rpms
subscription-manager repos --enable=rhel-7-server-rh-common-rpms
<% end -%>

<% if @host.operatingsystem.major.to_i == 6 %>
subscription-manager repos --enable=rhel-6-server-extras-rpms
subscription-manager repos --enable=rhel-6-server-optional-rpms
subscription-manager repos --enable=rhel-6-server-supplemental-rpms
subscription-manager repos --enable=rhel-6-server-rh-common-rpms
<% end -%>

