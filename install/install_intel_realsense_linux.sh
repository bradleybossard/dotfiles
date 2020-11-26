sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

sudo add-apt-repository --yes "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo focal main" -u

sudo apt-get install --yes librealsense2-dkms librealsense2-utils

sudo apt-get install --yes librealsense2-dev librealsense2-dbg

modinfo uvcvideo | grep "version:" should include realsense string

# test install
realsense-viewer

# should include realsense string
modinfo uvcvideo | grep "version:"
