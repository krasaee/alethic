#!/bin/bash

project=$1

./alethic-build/gitpull.sh $project
./alethic-build/build.sh --base-path /root --project $project
