#!/bin/bash

docker run \
  -it \
  --rm \
  --network=${PWD##*/}_backend \
  -v $PWD/transfer:/workspace/transfer \
  nvflare:admin \
  #/workspace/startup/fl_admin.sh
  bin/bash
