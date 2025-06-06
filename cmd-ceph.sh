#!/bin/bsah

# command of snapshot

rbd ls jing.meta

rbd children jing.meta/csi-vol-755

# command usually

ceph --status
ceph -s
