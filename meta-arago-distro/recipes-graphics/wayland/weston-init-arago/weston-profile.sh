if [ -f /home/weston/.weston-calibration ]; then
    export LIBINPUT_CALIBRATION_MATRIX="$(cat /home/weston/.weston-calibration)"
fi
