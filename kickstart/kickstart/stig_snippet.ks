<%#
kind: snippet
name: stig_snippet
%>
log_level: info

<%# This snippet will set up /etc/sudoers 
%>

#Set up sudoers - remove the NOPASSWD wheel group entry, allow password-based wheel group privilege escalation
sed -i -e '/## Same thing without a password/d' /etc/sudoers
sed -i -e '/#.*%wheel.*ALL=(ALL).*NOPASSWD:.*ALL/d' /etc/sudoers
sed -i -e 's/#.*%wheel.*ALL=(ALL).*ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

