#!/bin/bash
# create a cephfs of erasure

ceph osd pool create jingsuai-metadata
ceph osd pool create jingsuai-data
ceph osd pool create jingsuai-data-ec erasure
ceph osd pool set jingsuai-data-ec allow_ec_overwrites true

ceph fs new jingsuai-ec jingsuai-metadata jingsuai-data
ceph fs add_data_pool jingsuai-ec jingsuai-data-ec

ceph fs subvolumegroup create jingsuai-ec csi
ceph fs ls

ceph auth get-or-create client.jingsuai \
  mon 'allow r' \
  mds 'allow rw, allow rws path=/' \
  osd 'allow rwx pool=jingsuai-data, allow rwx pool=jingsuai-data-ec, allow rwx pool=jingsuai-metadata' 

ceph auth get client.jingsuai

