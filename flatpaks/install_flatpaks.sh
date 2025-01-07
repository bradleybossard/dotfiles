#!/usr/bin/env bash
for file in $(ls *.flatpakref); do flatpak install --noninteractive $file; done
