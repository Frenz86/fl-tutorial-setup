#!/bin/bash

docker run \
  -it \
  --rm \
  --network=nvflare_backend \
  -v $PWD/transfer:/workspace/transfer \
  nvflare:admin \
  /workspace/startup/fl_admin.sh
