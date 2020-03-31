#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.472 0.472 scale}>> setpagedevice" \
  -f combine.eps
