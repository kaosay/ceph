#!/bin/bash
# create rbd erasure on ceph

# if only 3 osd,must use ec-profile k=2 m=1
# sudo ceph osd pool create jsy-test-rbd erasure ec-profile
sudo ceph osd pool create jsy-test-rbd 16 16 erasure

sudo ceph osd pool get jsy-test-rbd all

sudo ceph osd pool set jsy-test-rbd allow_ec_overwrites true

sudo ceph osd pool  set jsy-test-rbd fast_read 1

# sudo ceph osd pool create jsy-test-rbd.meta 128
sudo ceph osd pool create jsy-test-rbd.meta 16 16


sudo ceph osd pool application enable jsy-test-rbd rbd
sudo ceph osd pool application enable jsy-test-rbd.meta rbd

sudo ceph auth caps client.jsy-test \
  mgr 'allow *' \
  mon 'allow r' \
  mds 'allow rw, allow rws path=/' \
  osd 'allow rwx pool=jsy-test-data, allow rwx pool=jsy-test-data-ec, allow rwx pool=jsy-test-metadata, allow rwx pool=jsy-test-rbd, allow rwx pool=jsy-test-rbd.meta'

#sudo ceph auth get-or-create client.jsy-test mon 'allow r' osd 'allow rwx pool=jsy-test-rbd, allow rwx pool=jsy-test-rbd.meta' -o /etc/ceph/ceph.client.jsy-test.keyring

sudo ceph auth get client.jsy-test

cat /etc/ceph/ceph.conf 
