##/altair/os/rhel8.2/ks/rhel8-admin.ks
lang en_US
keyboard us
timezone Asia/Kolkata --isUtc

# Root password

# Use graphical install
#graphical

# License agreement
eula --agreed

repo --name="app" --baseurl=http://10.0.0.1/os/rhel8.2/media1/AppStream
repo --name="base" --baseurl=http://10.0.0.1/os/rhel8.2/media1/BaseOS/

firstboot --disable

#platform x86_64
reboot
url --url=http://10.0.0.1/os/rhel8.2/media1/BaseOS/
bootloader --append="rhgb quiet crashkernel=auto"
zerombr
clearpart --all --initlabel
autopart
auth --passalgo=sha512 --useshadow
selinux --disabled
firewall --disable
firstboot --disable
%packages
@^minimal-environment

%end

%post  --log=/root/anaconda-post.log
mkdir -m0700 /root/.ssh/
chmod 0600 /root/.ssh/authorized_keys
restorecon -R /root/.ssh/
sed -i 's/=enforcing/=disabled/' /etc/selinux/config
systemctl disable rhsmcertd.service
systemctl mask rhsmcertd.service
chmod +x /etc/rc.d/rc.local
%end
