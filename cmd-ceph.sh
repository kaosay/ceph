#!/bin/bsah

# command of snapshot

rbd ls jing.meta

rbd children jing.meta/csi-vol-755

# command usually

# show status of ceph cluster
ceph --status
ceph -s

# show pools of ceph
ceph osd pool ls

# Show cluster’s free space status.
ceph df {detail}

# Subcommand ls to list file systems
ceph fs ls

# Show cluster’s health.
ceph health {detail}

# Delete pool
sudo ceph osd pool rm test-data test-data --yes-i-really-really-mean-it

# Delete fs
sudo ceph fs status jinsuai-ec
sudo ceph fs fail jinsuai-ec
sudo ceph fs rm jinsuai-ec --yes-i-really-mean-it
