echo "Running Script for Opnestack DEVSTACK"

# add stack user
echo "add STACK User"
useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
su - stack

# preRequiste Install DevStack
sudo pip install --upgrade pip

# clone Devstack git repository
echo "Clonning Devstack git repository"
apt install -y git libvirt-bin qemu-system-x86
su - stack -c "git clone https://github.com/openstack/devstack -b stable/stein"
cp /install/local.conf /opt/stack/devstack/local.conf
chown stack:stack /opt/stack/devstack/local.conf