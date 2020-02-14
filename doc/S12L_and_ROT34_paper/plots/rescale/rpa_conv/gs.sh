#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.842 0.838 scale}>> setpagedevice" \
  -f conv_v5.eps
