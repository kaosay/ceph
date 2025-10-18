#!/bin/bash
# create rbd erasure on ceph

# if only 3 osd,must use ec-profile k=2 m=1
# sudo ceph osd pool create jinsuai-rbd erasure ec-profile
sudo ceph osd pool create jinsuai-rbd 16 erasure

sudo ceph osd pool get jinsuai-rbd all

sudo ceph osd pool set jinsuai-rbd allow_ec_overwrites true

sudo ceph osd pool  set jinsuai-rbd fast_read 1

# sudo ceph osd pool create jinsuai-rbd.meta 128
sudo ceph osd pool create jinsuai-rbd.meta 16


sudo ceph osd pool application enable jinsuai-rbd rbd
sudo ceph osd pool application enable jinsuai-rbd.meta rbd

sudo ceph auth caps client.jinsuai \
  mgr 'allow *' \
  mon 'allow r' \
  mds 'allow rw, allow rws path=/' \
  osd 'allow rwx pool=jinsuai-data, allow rwx pool=jinsuai-data-ec, allow rwx pool=jinsuai-metadata, allow rwx pool=jinsuai-rbd, allow rwx pool=jinsuai-rbd.meta'

#sudo ceph auth get-or-create client.jinsuai mon 'allow r' osd 'allow rwx pool=jinsuai-rbd, allow rwx pool=jinsuai-rbd.meta' -o /etc/ceph/ceph.client.jinsuai.keyring

sudo ceph auth get client.jinsuai

cat /etc/ceph/ceph.conf 
