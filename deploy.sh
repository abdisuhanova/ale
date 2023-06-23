#!/bin/bash

# BRANCH_NAME is a default variable set by Jenkins
#    on Jenkins agents it's equal to the branch that's being built

# -e option will make sure that script stops on first error
# -x option will show you everything that script is running to the output, helpful for troubleshooting
set -ex
current_stage=dev

# define current stage based on branch name
if [[ $BRANCH_NAME == ap-setup_cicd_exchange ]]
then
    current_stage=dev
elif [[ $BRANCH_NAME == main ]]
then
    current_stage=staging
elif [[ $BRANCH_NAME == production-* ]]
then
    current_stage=prod
fi

# this will happen only in dev and staging stages
if [[ $current_stage == dev ]] || [[ $current_stage == staging ]]
then
    pushd web/
    make build stage=$current_stage
    make push stage=$current_stage
    popd
    pushd api/
    make build stage=$current_stage
    make push stage=$current_stage
    popd
fi

# this will happen regardless of the stage
pushd web/
make deploy stage=$current_stage
popd
pushd api/
make deploy stage=$current_stage
popd






