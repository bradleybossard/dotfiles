#!/bin/bash

# Define the root directory for your .flatpakref files
REPO_DIR="./flatpaks"

# Check if yad is installed
if ! command -v yad &> /dev/null; then
    echo "Error: 'yad' is required. Install with: sudo apt install yad"
    exit 1
fi

# 1. Build the data list
YAD_DATA=()
while IFS= read -r -d '' FILE_PATH; do
    CATEGORY=$(basename "$(dirname "$FILE_PATH")")
    FILENAME=$(basename "$FILE_PATH" .flatpakref) # Strip extension for cleaner UI
    
    # Format: Checkbox | Category | App Name | Hidden Full Path
    YAD_DATA+=("FALSE" "$CATEGORY" "$FILENAME" "$FILE_PATH")
done < <(find "$REPO_DIR" -type f -name "*.flatpakref" -print0)

if [ ${#YAD_DATA[@]} -eq 0 ]; then
    yad --error --text="No .flatpakref files found in $REPO_DIR" --width=300
    exit 1
fi

# 2. Present the GUI Tree with Search
# --search-column=3 targets the Application name by default
# Users can also use Ctrl+F in the window to trigger search
SELECTED_PATHS=$(yad --list --checklist --tree --tree-expanded \
    --title="Flatpakref Manager" \
    --text="Search by typing or use the 'Application' column search." \
    --column="Select":CHK \
    --column="Category" \
    --column="Application" \
    --column="Path":HIDE \
    "${YAD_DATA[@]}" \
    --width=800 --height=600 \
    --search-column=3 \
    --button="Install":0 --button="Cancel":1 \
    --print-column=4 --separator="|")

# 3. Exit if Cancelled
if [ $? -ne 0 ] || [ -z "$SELECTED_PATHS" ]; then
    echo "Installation cancelled."
    exit 0
fi

# 4. Install with Progress Bar
IFS="|"
(
    COUNT=0
    TOTAL=$(echo "$SELECTED_PATHS" | tr '|' '\n' | wc -l)
    
    for REF in $SELECTED_PATHS; do
        [[ -z "$REF" ]] && continue
        COUNT=$((COUNT + 1))
        PERCENT=$((COUNT * 100 / TOTAL))
        
        # Update progress bar text
        echo "# Installing ($COUNT/$TOTAL): $(basename "$REF")"
        echo "$PERCENT"
        
        # Run flatpak install
        flatpak install --user --noninteractive -y "$REF" > /dev/null 2>&1
    done
) | yad --progress --title="Installing Flatpaks" --text="Initializing..." \
    --percentage=0 --auto-close --width=400

yad --info --text="All selected Flatpaks have been installed." --width=300
