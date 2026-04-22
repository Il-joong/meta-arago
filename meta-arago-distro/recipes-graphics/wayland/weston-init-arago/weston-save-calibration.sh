#!/bin/sh
# Called by weston after touchscreen calibration completes.
# Args: <device-syspath> <m0> <m1> <m2> <m3> <m4> <m5>

MATRIX="$2 $3 $4 $5 $6 $7"
echo "${MATRIX}" > /home/weston/.weston-calibration
chown weston:weston /home/weston/.weston-calibration
