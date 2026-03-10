#!/bin/bash

# Define the directory where your .flatpak files are stored
REPO_DIR="./flatpaks"

# 1. Find all .flatpak files recursively and format them for Zenity
# We use a null-separated loop to handle spaces in filenames safely
mapfile -d '' FILES < <(find "$REPO_DIR" -type f -name "*.flatpakref" -print0)

if [ ${#FILES[@]} -eq 0 ]; then
    zenity --error --text="No .flatpak files found in $REPO_DIR"
    exit 1
fi

# 2. Present the GUI list
# --list creates the table, --checklist adds the toggle boxes
SELECTED_FILES=$(zenity --list --checklist \
    --title="Select Flatpaks to Install" \
    --column="Select" --column="File Path" \
    $(for f in "${FILES[@]}"; do echo "FALSE"; echo "$f"; done) \
    --width=600 --height=400 --separator="|")

# 3. Exit if the user hits Cancel
if [ $? -ne 0 ] || [ -z "$SELECTED_FILES" ]; then
    echo "Installation cancelled."
    exit 0
fi

# 4. Install the selected files
# We change the IFS to the pipe separator we defined in Zenity
IFS="|"
for FILE in $SELECTED_FILES; do
    echo "Installing: $FILE"
    flatpak install --user --noninteractive "$FILE" -y
done

zenity --info --text="Installation process complete."
