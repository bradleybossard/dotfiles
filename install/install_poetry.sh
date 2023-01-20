#!/bin/bash
curl -sSL https://install.python-poetry.org | python3 -

# add completions
mkdir -p ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry


# This makes poetry create venvs in the project dir
# Otherwise VS Code doesn't find them under ~/.cache/pypoetry
poetry config virtualenvs.in-project true
poetry config virtualenvs.prefer-active-python true
