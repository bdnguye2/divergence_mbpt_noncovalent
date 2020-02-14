#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.59 0.61 scale}>> setpagedevice" \
  -f s30l_compare2.eps
