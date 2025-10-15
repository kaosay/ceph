#!/bin/bash
# create rbd erasure on ceph

# if only 3 osd,must use ec-profile k=2 m=1
# sudo ceph osd pool create jingsuai-rbd erasure ec-profile
sudo ceph osd pool create jingsuai-rbd erasure

sudo ceph osd pool get jingsuai-rbd all

sudo ceph osd pool set jingsuai-rbd allow_ec_overwrites true

sudo ceph osd pool  set jingsuai-rbd fast_read 1

sudo ceph osd pool create jingsuai-rbd.meta 128


sudo ceph osd pool application enable jingsuai-rbd rbd
sudo ceph osd pool application enable jingsuai-rbd.meta rbd

sudo ceph auth caps client.jingsuai \
  mgr 'allow *' \
  mon 'allow r' \
  mds 'allow rw, allow rws path=/' \
  osd 'allow rwx pool=jingsuai-data, allow rwx pool=jingsuai-data-ec, allow rwx pool=jingsuai-metadata, allow rwx pool=jingsuai-rbd, allow rwx pool=jingsuai-rbd.meta'

#sudo ceph auth get-or-create client.jingsuai mon 'allow r' osd 'allow rwx pool=jingsuai-rbd, allow rwx pool=jingsuai-rbd.meta' -o /etc/ceph/ceph.client.jingsuai.keyring

sudo ceph auth get client.jingsuai

cat /etc/ceph/ceph.conf 
