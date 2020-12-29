#!/bin/bash

OPENSCAD_LIBRARY_DIR="$HOME/.local/share/OpenSCAD/libraries"
pushd .
mkdir -p $OPENSCAD_LIBRARY_DIR
cd $OPENSCAD_LIBRARY_DIR
# BOSL
wget https://github.com/revarbat/BOSL/archive/v1.0.1.zip
unzip v1.0.1.zip
popd
