#!/bin/bash

# Define the root directory for your .flatpakref files
REPO_DIR="./flatpaks"

# Check if yad is installed
if ! command -v yad &> /dev/null; then
    echo "Error: 'yad' is required. Install with: sudo apt install yad"
    exit 1
fi

# 1. Get a list of currently installed Flatpak IDs
# We store this in a string for quick grepping
INSTALLED_APPS=$(flatpak list --columns=application)

# 2. Build the data list
YAD_DATA=()
while IFS= read -r -d '' FILE_PATH; do
    CATEGORY=$(basename "$(dirname "$FILE_PATH")")
    FILENAME=$(basename "$FILE_PATH" .flatpakref)
    
    # Extract the Application ID from the .flatpakref file
    # Most .flatpakref files have a line: Name=org.domain.App
    APP_ID=$(grep -m 1 "Name=" "$FILE_PATH" | cut -d'=' -f2)
    
    # If we can't find the ID in the file, we fallback to checking the filename
    # (Some refs use the ID as the filename)
    CHECK_ID="${APP_ID:-$FILENAME}"

    if echo "$INSTALLED_APPS" | grep -qxw "$CHECK_ID"; then
        # App is already installed: Add tag and keep checkbox FALSE
        APP_LABEL="[INSTALLED] $FILENAME"
        IS_INSTALLED="FALSE"
    else
        # App is not installed
        APP_LABEL="$FILENAME"
        IS_INSTALLED="FALSE"
    fi
    
    YAD_DATA+=("$IS_INSTALLED" "$CATEGORY" "$APP_LABEL" "$FILE_PATH")
done < <(find "$REPO_DIR" -type f -name "*.flatpakref" -print0)

if [ ${#YAD_DATA[@]} -eq 0 ]; then
    yad --error --text="No .flatpakref files found in $REPO_DIR" --width=300
    exit 1
fi

# 3. Present the GUI Tree
SELECTED_PATHS=$(yad --list --checklist --tree --tree-expanded \
    --title="Flatpakref Manager" \
    --text="Apps marked [INSTALLED] are already on your system." \
    --column="Select":CHK \
    --column="Category" \
    --column="Application" \
    --column="Path":HIDE \
    "${YAD_DATA[@]}" \
    --width=800 --height=600 \
    --search-column=3 \
    --button="Install":0 --button="Cancel":1 \
    --print-column=4 --separator="|")

# 4. Exit if Cancelled
if [ $? -ne 0 ] || [ -z "$SELECTED_PATHS" ]; then
    echo "Installation cancelled."
    exit 0
fi

# 5. Install with Progress Bar
IFS="|"
(
    # Filter out empty entries from the pipe separator
    CLEAN_PATHS=()
    for P in $SELECTED_PATHS; do [[ -n "$P" ]] && CLEAN_PATHS+=("$P"); done
    
    TOTAL=${#CLEAN_PATHS[@]}
    COUNT=0
    
    for REF in "${CLEAN_PATHS[@]}"; do
        COUNT=$((COUNT + 1))
        PERCENT=$((COUNT * 100 / TOTAL))
        
        APP_NAME=$(basename "$REF" .flatpakref)
        echo "# Installing ($COUNT/$TOTAL): $APP_NAME"
        echo "$PERCENT"
        
        flatpak install --user --noninteractive -y "$REF" > /dev/null 2>&1
    done
) | yad --progress --title="Installing Flatpaks" --text="Initializing..." \
    --percentage=0 --auto-close --width=400

yad --info --text="Process complete!" --width=300
