#!/bin/bash

# Enable job control
set -m

# Run startup script
source /workspace/startup/start.sh

# Bring process to foreground
fg
