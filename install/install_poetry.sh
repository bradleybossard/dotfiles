#!/bin/bash
curl -sSL https://install.python-poetry.org | python3 -

# add completions
mkdir -p ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry

