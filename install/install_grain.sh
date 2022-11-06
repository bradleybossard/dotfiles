#!/bin/bash

asdf plugin add grain

# List all available version
asdf list all grain

asdf install grain latest
asdf global grain latest

# Note: hopefully this is fixed next time I try to install
# Otherwise follow this procedure to move the grain binary
# https://github.com/cometkim/asdf-grain/issues/3#issuecomment-1237663030
