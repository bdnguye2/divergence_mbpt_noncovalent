#!/bin/bash

gs                                                \
  -o scaled.eps                                   \
  -sDEVICE=eps2write                              \
  -c "<</Install {.123 .123 scale}>> setpagedevice" \
  -f int_gold.eps
