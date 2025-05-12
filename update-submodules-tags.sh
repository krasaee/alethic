#!/bin/bash

# Get all submodule paths and URLs
submodule_info=$(git config --file .gitmodules --get-regexp "submodule\\..+\\.(path|url)" | sort)

# Process each submodule
while read -r config_key config_value; do
  if [[ $config_key == *".path" ]]; then
    path=$config_value
  elif [[ $config_key == *".url" ]] && [[ ! -z "$path" ]]; then
    url=$config_value
    
    echo "Processing submodule: $path"
    
    # Navigate to submodule directory
    cd "$path" || { echo "Failed to enter $path"; continue; }
    
    # Fetch all remote data including tags
    git fetch --tags
    
    # Get the latest tag (sorted by version), assumes semantic versioning
    latest_tag=$(git tag -l --sort=-v:refname | head -n 1)
    
    if [[ -z "$latest_tag" ]]; then
      echo "No tags found for $path, skipping..."
      cd - > /dev/null
      continue
    fi
    
    echo "Latest tag for $path is $latest_tag"
    
    # Return to root directory
    cd - > /dev/null
    
    # Update submodule to point to the latest tag
    git config -f .gitmodules submodule.$path.branch "$latest_tag"
    git submodule update --remote "$path"
    
    # Reset path for next iteration
    path=""
  fi
done <<< "$submodule_info"

# Commit these changes
echo "Committing updated submodule references..."
git add .gitmodules
git add $(git submodule status | awk '{print $2}')
git commit -m "Update all submodules to their latest tags"

echo "All submodules are now configured to track their latest release tags."
