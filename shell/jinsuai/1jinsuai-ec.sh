#!/bin/bash
# create a cephfs of erasure

sudo ceph osd pool create jinsuai-metadata 16
sudo ceph osd pool create jinsuai-data 16 
sudo ceph osd pool create jinsuai-data-ec 16 erasure
sudo ceph osd pool set jinsuai-data-ec allow_ec_overwrites true

sudo ceph fs new jinsuai-ec jinsuai-metadata jinsuai-data
sudo ceph fs add_data_pool jinsuai-ec jinsuai-data-ec

sudo ceph fs subvolumegroup create jinsuai-ec csi
sudo ceph fs ls

sudo ceph auth get-or-create client.jinsuai \
  mon 'allow r' \
  mds 'allow rw, allow rws path=/' \
  osd 'allow rwx pool=jinsuai-data, allow rwx pool=jinsuai-data-ec, allow rwx pool=jinsuai-metadata' 

sudo ceph auth get client.jinsuai

