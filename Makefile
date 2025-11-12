# Alethic-ISM Makefile
# Manages git submodules and repository operations

.PHONY: help init update sync push status clean fetch-tags checkout-latest

# Default target
help:
	@echo "Alethic-ISM Makefile Commands:"
	@echo "  make init          - Initialize all submodules"
	@echo "  make update        - Update all submodules to latest remote"
	@echo "  make sync          - Full sync: init, update, and checkout latest tags"
	@echo "  make push          - Push changes to upstream (main repo only)"
	@echo "  make push-all      - Push main repo and all submodule changes"
	@echo "  make status        - Show status of all submodules"
	@echo "  make fetch-tags    - Fetch all tags for all submodules"
	@echo "  make checkout-latest - Checkout latest tags for all submodules"
	@echo "  make clean         - Clean submodule directories"

# Initialize submodules
init:
	@echo "Initializing submodules..."
	git submodule update --init --recursive

# Update submodules to latest remote main branch
update:
	@echo "Updating submodules to latest remote..."
	git submodule update --remote

# Full sync operation (from README)
sync: init update
	@echo "Syncing all submodules..."
	@echo "Submodules synchronized successfully!"

# Fetch tags and checkout latest for all submodules (from README)
fetch-tags:
	@echo "Fetching tags for all submodules..."
	git submodule foreach 'git fetch --tags'

checkout-latest: fetch-tags
	@echo "Checking out latest tags for all submodules..."
	git submodule foreach 'git checkout $$(git describe --tags `git rev-list --tags --max-count=1`)'

# Push main repository changes
push:
	@echo "Pushing main repository changes..."
	git push origin main

# Push all changes (main repo and submodules)
push-all:
	@echo "Pushing all submodule changes..."
	git submodule foreach 'git push origin HEAD:main || echo "Failed to push $$name"'
	@echo "Pushing main repository changes..."
	git push origin main

# Show status of all submodules
status:
	@echo "Submodule status:"
	@git submodule status

# Clean submodule directories
clean:
	@echo "Cleaning submodule directories..."
	git submodule deinit -f --all
	@echo "Submodules cleaned. Run 'make init' to re-initialize."

# Advanced operations
.PHONY: update-recursive pull-all check-updates

# Update recursively (including nested submodules)
update-recursive:
	@echo "Updating all submodules recursively..."
	git submodule update --init --recursive --remote

# Pull latest changes for main repo and all submodules
pull-all:
	@echo "Pulling latest changes for main repository..."
	git pull origin main
	@echo "Pulling latest changes for all submodules..."
	git submodule foreach 'git pull origin main || git pull origin master || echo "Could not pull $$name"'

# Check for available updates
check-updates:
	@echo "Checking for updates in submodules..."
	@git submodule foreach 'echo "Checking $$name..." && git fetch && git status -uno'

# Development helpers
.PHONY: list-modules modified-modules

# List all submodules
list-modules:
	@echo "Installed submodules:"
	@git submodule foreach 'echo "  - $$name ($$sha1)"'

# Show modified submodules
modified-modules:
	@echo "Modified submodules:"
	@git status --porcelain | grep "^.M" | cut -c4-
