#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

source /etc/packer/files/functions.sh

# wait for cloud-init to finish
wait_for_cloudinit

################################################################################
### Juniper ##################################################################
################################################################################
echo "### Juniper ##################################################################"
#echo "### Copy Platter files ##################################################################"
#wget https://jnpr-cnr.s3.us-east-2.amazonaws.com/platter-arm64-20210513-1d6ecc2.tgz
#wget https://jnpr-cnr.s3.us-east-2.amazonaws.com/crpd-arm64-21.3I20210427_1631.docker.tgz
#echo "### Copy Platter files ##################################################################"
echo "### Linux extras #########################################"
version=`uname -r`
sudo apt-get install -y tcpdump jq ethtool tmux linux-modules-extra-$version
echo "### Linux extras completed #########################################"
echo "### LOAD linux modules #########################################"
sudo modprobe mpls_router
sudo modprobe mpls_iptunnel
sudo modprobe fou
sudo modprobe vxlan

echo "### LOAD linux modules completed #########################################"
