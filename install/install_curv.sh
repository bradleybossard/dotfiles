# From the BUILD instructions https://github.com/curv3d/curv/blob/master/BUILD.md

sudo apt install --yes cmake git-core libboost-all-dev libdouble-conversion-dev libopenexr-dev libtbb-dev libglm-dev gedit

sudo apt-get install --yes libxcursor-dev libxinerama-dev libxrandr-dev libglu1-mesa-dev libgles2-mesa-dev libgl1-mesa-dev libxi-dev

cd ~/src
git clone --recursive https://github.com/curv3d/curv
git submodule update --init
cd curv
make
sudo make install

# Test that the install worked
# curv -le myshape.curv
