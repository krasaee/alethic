#!/bin/bash

export GIT_USERNAME=krasaee
export GIT_TOKEN=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

DOCKER_NAMESPACE="krasaee"

# List of projects
projects=(
    "alethic-ism-core"
    "alethic-ism-db"
    "alethic-ism-state-router"
    "alethic-ism-api"
    "alethic-ism-usage"
    "alethic-ism-monitor"
    "alethic-ism-state-sync-store"
    "alethic-ism-stream-api"
    "alethic-ism-query-api"
    "alethic-ism-processor-openai"
    "alethic-ism-processor-llama"
    "alethic-ism-processor-anthropic"
    "alethic-ism-processor-gemini"
    "alethic-ism-processor-python"
    "alethic-ism-processor-state-coalescer"
    "alethic-ism-transformer-composite"
    "alethic-ism-ui"
)

BASE_PATH=$(pwd)
VERSION_HASH=$(openssl rand -hex 8)
VERSION_BUMP=true
SINGLE_PROJECT=""
DEPLOY_ONLY=false

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --no-version-bump) VERSION_BUMP=false ;;
        --deploy-only) DEPLOY_ONLY="$2"; shift ;;
        --base-path) BASE_PATH="$2"; shift ;;
        --project) SINGLE_PROJECT="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Function to build and handle versioning for a project
build_project() {
    local project_name=$1

    # bump the version hash if VERSION_BUMP is true
    project_path="$BASE_PATH/$project_name"
    cd $project_path

    if [ "$VERSION_BUMP" = true ]; then
        echo "$VERSION_HASH" > VERSION.txt
        git add VERSION.txt
        git commit -m "bumped version hash ${VERSION_HASH}"
        git push
    fi

    # get the updated commit id to build the IMAGE TAG
    local git_commit_id=$(git rev-parse HEAD)
    TAG="$DOCKER_NAMESPACE/$project_name:$git_commit_id"

    echo "=================================================="
    echo "Version Hash: $VERSION_HASH"
    echo "Project Path: $project_path"
    echo "Docker Tag: $TAG"
    echo "=================================================="
    
    # build the docker container
    if [ "$DEPLOY_ONLY" = true ];
    then
      ./docker_deploy.sh -t $TAG
    else
      ./docker_build.sh -t $TAG
      ./docker_deploy.sh -t $TAG
    fi
}

if [ -n "$SINGLE_PROJECT" ]; then
    if [[ " ${projects[@]} " =~ " ${SINGLE_PROJECT} " ]]; then
        build_project "$SINGLE_PROJECT"
    else
        echo "Error: Project '$SINGLE_PROJECT' not found in the list of valid projects."
        exit 1
    fi
else
    # Loop through projects and build each one
    for project in "${projects[@]}"; do
        #if [ "$project" == "alethic-ism-db" ] || [ "$project" == "alethic-ism-core" ]; then
          echo "________________________"
          echo ">>>>>>> $project <<<<<<<"
          echo "------------------------"
          build_project "$project" 
    done
fi

echo "Version Hash: $VERSION_HASH"

