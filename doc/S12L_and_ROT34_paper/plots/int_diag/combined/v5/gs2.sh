#!/bin/bash
#0.272 0.33
gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.6 0.65 scale}>> setpagedevice" \
  -f combine.pdf
