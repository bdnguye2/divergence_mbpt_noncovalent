#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.42 0.42 scale}>> setpagedevice" \
  -f extrapol.eps
