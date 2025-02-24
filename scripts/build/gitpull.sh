#!/bin/bash

# Script: update_projects.sh
# Purpose: Pull the latest changes from git repositories for a list of projects.

# Check if at least one project is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 project_directory [project_directory ...]"
    exit 1
fi

# Iterate over each project directory passed as arguments
for project_dir in "$@"; do
    echo "Updating project in directory: $project_dir"
    
    # Check if the directory exists
    if [ -d "$project_dir" ]; then
        cd "$project_dir" || { echo "Failed to enter directory $project_dir"; continue; }
        
        # Check if it's a git repository
        if [ -d ".git" ]; then
            # Pull the latest changes
            git config pull.rebase false  # merge
	    git pull --all --force
	    git reset --hard origin/main
        else
            echo "Directory $project_dir is not a git repository."
        fi
        
        # Return to the previous directory
        cd - >/dev/null || exit
    else
        echo "Directory $project_dir does not exist."
    fi
    
    echo "--------------------------------------------"
done

