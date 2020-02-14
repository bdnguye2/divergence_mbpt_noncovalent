#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {0.0870 0.0873 scale}>> setpagedevice" \
  -f ni_toc.eps
