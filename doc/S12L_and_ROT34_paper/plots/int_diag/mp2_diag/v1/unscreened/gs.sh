#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {1.22 1.21 scale}>> setpagedevice" \
  -f mp2-crop.eps
