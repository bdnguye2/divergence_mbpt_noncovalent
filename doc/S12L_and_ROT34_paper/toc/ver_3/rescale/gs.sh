#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.048 0.048 scale}>> setpagedevice" \
  -f ni_toc.eps
