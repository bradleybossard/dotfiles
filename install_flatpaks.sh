#!/bin/bash

# Define the root directory for your .flatpakref files
REPO_DIR="./flatpaks"

# Check if yad is installed
if ! command -v yad &> /dev/null; then
    echo "Error: 'yad' is required for the tree view. Please install it."
    exit 1
fi

# 1. Build the data list for the YAD tree
# Format: TRUE/FALSE (checked) | Category | Filename | Full Path
YAD_DATA=()

# Find all .flatpakref files
while IFS= read -r -d '' FILE_PATH; do
    # Get the parent directory name (Category)
    CATEGORY=$(basename "$(dirname "$FILE_PATH")")
    # Get just the filename
    FILENAME=$(basename "$FILE_PATH")
    
    # Add to array: Checkbox (False) | Category | Filename | Path (hidden)
    YAD_DATA+=("FALSE" "$CATEGORY" "$FILENAME" "$FILE_PATH")
done < <(find "$REPO_DIR" -type f -name "*.flatpakref" -print0)

if [ ${#YAD_DATA[@]} -eq 0 ]; then
    yad --error --text="No .flatpakref files found in $REPO_DIR" --width=300
    exit 1
fi

# 2. Present the GUI Tree
# --list with --tree makes it collapsible by the first column after the checkbox
SELECTED_PATHS=$(yad --list --checklist --tree --tree-expanded \
    --title="Flatpakref Manager" \
    --column="Select":CHK \
    --column="Category" \
    --column="Application" \
    --column="Path":HIDE \
    "${YAD_DATA[@]}" \
    --width=800 --height=600 \
    --button="Install":0 --button="Cancel":1 \
    --print-column=4 --separator="|")

# 3. Exit if the user hits Cancel
if [ $? -ne 0 ] || [ -z "$SELECTED_PATHS" ]; then
    echo "Installation cancelled."
    exit 0
fi

# 4. Install the selected files
IFS="|"
for REF in $SELECTED_PATHS; do
    # Remove any trailing separators from YAD output
    [[ -z "$REF" ]] && continue
    echo "--------------------------------------"
    echo "Installing: $REF"
    flatpak install --user --noninteractive -y "$REF"
done

yad --info --text="Installation complete!" --width=300
