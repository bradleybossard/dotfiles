#!/bin/bash

# Define the root directory for your .flatpakref files
REPO_DIR="./flatpaks"

# Check if yad is installed
if ! command -v yad &> /dev/null; then
    echo "Error: 'yad' is required. Install with: sudo apt install yad"
    exit 1
fi

while true; do
    # 1. Get a list of currently installed Flatpak IDs
    INSTALLED_APPS=$(flatpak list --columns=application)

    # 2. Build the data list
    YAD_DATA=()
    TOTAL_COUNT=0
    INSTALLED_COUNT=0

    while IFS= read -r -d '' FILE_PATH; do
        ((TOTAL_COUNT++))
        CATEGORY=$(basename "$(dirname "$FILE_PATH")")
        FILENAME=$(basename "$FILE_PATH" .flatpakref)
        
        # Extract Application ID
        APP_ID=$(grep -m 1 "Name=" "$FILE_PATH" | cut -d'=' -f2)
        CHECK_ID="${APP_ID:-$FILENAME}"

        # Determine status icon
        # gtk-apply = Green Checkmark | gtk-cancel = Red X
        if echo "$INSTALLED_APPS" | grep -qxw "$CHECK_ID"; then
            STATUS_ICON="gtk-apply"
            ((INSTALLED_COUNT++))
        else
            STATUS_ICON="gtk-cancel" 
        fi
        
        YAD_DATA+=("FALSE" "$CATEGORY" "$FILENAME" "$STATUS_ICON" "$FILE_PATH")
    done < <(find "$REPO_DIR" -type f -name "*.flatpakref" -print0)

    # 3. Present the GUI Tree
    SELECTED_PATHS=$(yad --list --checklist --tree --tree-expanded \
        --title="Flatpak Manager" \
        --text="<b>Repository Summary:</b> Total Apps: $TOTAL_COUNT  |  Installed: $INSTALLED_COUNT" \
        --column="Select":CHK \
        --column="Category" \
        --column="Application" \
        --column="Installed":IMG \
        --column="Path":HIDE \
        "${YAD_DATA[@]}" \
        --width=850 --height=600 \
        --search-column=3 \
        --button="Install Selected":0 \
        --button="Update All Apps":2 \
        --button="Refresh List":4 \
        --button="Cancel":1 \
        --print-column=5 --separator="|")

    EXIT_STATUS=$?

    # 4. Handle Button Actions
    if [ $EXIT_STATUS -eq 1 ] || [ $EXIT_STATUS -eq 252 ]; then
        break

    elif [ $EXIT_STATUS -eq 4 ]; then
        continue

    elif [ $EXIT_STATUS -eq 2 ]; then
        # UPDATE ALL APPS
        (
            echo "# Checking for updates..."
            echo "10"
            flatpak update --user --noninteractive -y > /dev/null 2>&1
            echo "100"
        ) | yad --progress --title="Updating Flatpaks" --text="Running system update..." \
            --percentage=0 --auto-close --width=400
        continue

    elif [ $EXIT_STATUS -eq 0 ]; then
        # INSTALL SELECTED
        if [ -z "$SELECTED_PATHS" ]; then
            continue
        fi

        IFS="|"
        (
            CLEAN_PATHS=()
            read -ra ADDR <<< "$SELECTED_PATHS"
            for P in "${ADDR[@]}"; do [[ -n "$P" ]] && CLEAN_PATHS+=("$P"); done
            
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
    fi
done