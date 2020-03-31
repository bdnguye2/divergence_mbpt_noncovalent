#!/bin/bash
#0.272 0.33
gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.9587 0.9587 scale}>> setpagedevice" \
  -f mp2-crop.pdf
