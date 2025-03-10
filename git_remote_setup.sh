#!/bin/bash

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Move to the script's parent directory to ensure cloning at the correct level
cd "$SCRIPT_DIR/.." || exit

# Get repo URL
read -p "Enter classroom repository URL: " CLASSROOM_REPO
read -p "Enter personal repository URL: " PERSONAL_REPO

# Extract repo name
REPO_NAME=$(basename "$CLASSROOM_REPO" .git)

echo "Cloning into: $REPO_NAME"

# Clone repo
git clone "$CLASSROOM_REPO"

# Check clone
if [ -d "$REPO_NAME" ]; then
    echo "Cloning successful. Changing directory..."
    cd "$REPO_NAME" || { echo "Failed to enter directory $REPO_NAME"; exit 1; }
else
    echo "Error: Cloning failed or directory not found!"
    exit 1
fi

# Define local config file
CONFIG_FILE="$HOME/.gitconfig.local"

# Check config file  is exists?
if [ -f "$CONFIG_FILE" ]; then
    # Load config
    source "$CONFIG_FILE"
    echo "Stored Git config found: $GIT_NAME <$GIT_EMAIL>"
    
    # Ask user if they want to reuse the stored config
    read -p "Use this configuration? (yes/no): " USE_OLD_CONFIG
    
    if [[ "$USE_OLD_CONFIG" =~ ^[Nn] ]]; then
        # Ask for new config
        read -p "Enter your Git user name: " GIT_NAME
        read -p "Enter your Git email: " GIT_EMAIL
        
        # Save new config
        echo "GIT_NAME=\"$GIT_NAME\"" > "$CONFIG_FILE"
        echo "GIT_EMAIL=\"$GIT_EMAIL\"" >> "$CONFIG_FILE"
    fi
else
    # First-time setup: Ask for config
    read -p "Enter your Git user name: " GIT_NAME
    read -p "Enter your Git email: " GIT_EMAIL

    # Save config
    echo "GIT_NAME=\"$GIT_NAME\"" > "$CONFIG_FILE"
    echo "GIT_EMAIL=\"$GIT_EMAIL\"" >> "$CONFIG_FILE"
fi

# Git config local repo
git config --local user.name "$GIT_NAME"
git config --local user.email "$GIT_EMAIL"

# Git add remote for classroom repo
git remote add all "$CLASSROOM_REPO"
git remote set-url --add --push all "$CLASSROOM_REPO"

# Git add remote for personal repo
git remote set-url --add --push all "$PERSONAL_REPO"

# Set branch
git branch -u origin/main

# Show configured remotes
git remote -v

echo "Git repository setup completed successfully with $GIT_NAME <$GIT_EMAIL>!"