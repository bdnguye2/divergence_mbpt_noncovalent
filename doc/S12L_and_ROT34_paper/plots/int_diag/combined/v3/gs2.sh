#!/bin/bash
#0.272 0.33
gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.368 0.45 scale}>> setpagedevice" \
  -f combine.pdf
