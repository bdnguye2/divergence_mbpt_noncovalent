#!/bin/bash
#0.272 0.33
gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.9875 0.9793 scale}>> setpagedevice" \
  -f mp2c-crop.pdf
