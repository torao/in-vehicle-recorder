#!/bin/bash
# Script to be executed at system startup.

# Set this variable explicitly if the video input device cannot be detected correctly.
# The appropriate device can be found by `v4l2-ctl --list-devices`.
#DEVICE_CAMERA=/dev/video0

# Set this variable explicitly if the audio input device cannot be detected correctly.
# The appropriate device can be found by `arecord --list-devices`.
#DEVICE_AUDIO=1,0

python3 $(dirname $0)/gpslog.py > /dev/null 2>&1 &
python3 $(dirname $0)/coordinate.py -lf 3G -lt 1M &
python3 $(dirname $0)/record.py &
