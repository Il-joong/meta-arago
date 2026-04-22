#!/bin/sh

if [ -e /dev/input/touchscreen0 ]; then
	echo "Touch screen detected..."
	if [ -e /home/weston/.calibration-done ]; then
		echo "Calibration already done, skipping..."
		exit 0
	fi
	echo "Calibrating touchscreen..."
	weston-calibrator
	touch /home/weston/.calibration-done
	chown weston:weston /home/weston/.calibration-done
else
	echo "Touch screen not detected, skipping calibration..."
fi
