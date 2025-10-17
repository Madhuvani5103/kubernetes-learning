#Start VMs 

./deploy-virtual-machines

#Quit and restart deploying (unload and load) https://github.com/canonical/multipass/issues/1983#issuecomment-786004767
#BRIDGE="NAT" line 15 deploy-virtual-machines

sudo launchctl unload /Library/LaunchDaemons/com.canonical.multipassd.plist
sudo launchctl load /Library/LaunchDaemons/com.canonical.multipassd.plist

#clear IPS
sudo vi /var/db/dhcpd_leases

#remove these blocks


{
    name=controlplane
    ip_address=192.168.64.4
    hw_address=1,52:54:0:78:4d:ff
    identifier=1,52:54:0:78:4d:ff
    lease=0x65dc3134
}

#https://github.com/kodekloudhub/certified-kubernetes-administrator-course/blob/master/kubeadm-clusters/apple-silicon/docs/02-compute-resources.md