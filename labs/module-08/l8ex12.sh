#!/bin/bash


# Define variable
ROSTERTXT=~/Documents/roster.txt
LOG_FILE=~/Documents/l8ex11-log.log

# Create log file if not exist
if [ ! -f $LOG_FILE ]; then
	touch $LOG_FILE
fi

# Function to log messages with a timestamp
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Function to create a user account and home directory if needed
create_user() {
    local NAME="$1"
    local HOME_DIR="/home/$NAME"

    if [ ! -d "$HOME_DIR" ]; then
        # Create the user account
        sudo useradd -c "Account for $NAME" -s /bin/bash -d "$HOME_DIR" -m "$NAME" &>> "$LOG_FILE"
        if [ $? -eq 0 ]; then
            log_message "Created account for $NAME"
            echo "Created account for $NAME"
        else
            log_message "Failed to create account for $NAME."
            echo "Failed to create account for $NAME. Check $LOG_FILE for details." >&2
            return 1
        fi
    else
        echo "Account for $NAME already exists. Skipping..."
    fi
}

# Function to set up SSH directory and keys for a user
setup_ssh() {
    local NAME="$1"
    local HOME_DIR="/home/$NAME"
    local SSH_DIR="$HOME_DIR/.ssh"
    local SSH_KEY="$SSH_DIR/id_ed25519_$NAME"

    # Check if .ssh directory exists, create if not
    if [ ! -d "$SSH_DIR" ]; then
        sudo mkdir -p "$SSH_DIR"
        sudo chown "$NAME":"$NAME" "$SSH_DIR"
        log_message "Created .ssh directory for $NAME"
    fi

    # Check if SSH key exists, create if not
    if [ ! -f "$SSH_KEY" ]; then
        sudo ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" &>> "$LOG_FILE"
        sudo chown "$NAME":"$NAME" "$SSH_KEY"*
        log_message "Created SSH keys for $NAME"
        echo "SSH keys created for $NAME"
    else
        echo "SSH keys already exist for $NAME. Skipping..."
    fi
}

# Main loop to process each name in the roster
while read -r LINE; do
    NAME="$LINE"

    # Create the user if they don't already exist
    create_user "$NAME"

    # Set up SSH keys for the user
    setup_ssh "$NAME"

done < "$ROSTERTXT"

