#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.1048 0.1066 scale}>> setpagedevice" \
  -f mp2_screened2.eps
