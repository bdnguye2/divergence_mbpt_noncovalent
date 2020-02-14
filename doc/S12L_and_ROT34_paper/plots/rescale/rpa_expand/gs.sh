#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.626 0.672 scale}>> setpagedevice" \
  -f rpa_expand4.eps
