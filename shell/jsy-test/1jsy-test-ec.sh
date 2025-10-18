#!/bin/bash
# create a cephfs of erasure

sudo ceph osd pool create jsy-test-metadata 16 16
sudo ceph osd pool create jsy-test-data 16 16 
sudo ceph osd pool create jsy-test-data-ec 16 16 erasure
sudo ceph osd pool set jsy-test-data-ec allow_ec_overwrites true

sudo ceph fs new jsy-test-ec jsy-test-metadata jsy-test-data
sudo ceph fs add_data_pool jsy-test-ec jsy-test-data-ec

sudo ceph fs subvolumegroup create jsy-test-ec csi
sudo ceph fs ls

sudo ceph auth get-or-create client.jsy-test \
  mon 'allow r' \
  mds 'allow rw, allow rws path=/' \
  osd 'allow rwx pool=jsy-test-data, allow rwx pool=jsy-test-data-ec, allow rwx pool=jsy-test-metadata' 

sudo ceph auth get client.jsy-test

