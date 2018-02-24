# Debian 9 packer template

OS: debian 9 (Stretch)
Arch: amd64
Type: virtualbox-iso
Post-processors: Vagrant

Creates a box using the netinst iso for Stretch (9.3.0-amd64-netinst.iso).

Build:

    packer build debian9-vagrant.json
