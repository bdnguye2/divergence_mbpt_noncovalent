#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.3096 0.3132 scale}>> setpagedevice" \
  -f mp2_screened2.eps
