#!/bin/bash
# Automation script for CloudFormation templates. 
#
# Parameters
#   $1: Execution mode.
#       Valid values: deploy, delete, preview.
#   $2: Name of the cloudformation stack. 
#       The cloudformation template and parameters file need to be named 
#       after the stack name, i.e. `stackname.yml` and `stackname.json`.
#
# Usage examples:
#   ./cloudformation_run.sh deploy network
#   ./cloudformation_run.sh delete network
#   ./cloudformation_run.sh preview network
#

# Validate parameters
if [[ $1 != "deploy" && $1 != "delete" && $1 != "preview" ]]; then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi

EXECUTION_MODE=$1
STACK_NAME=$2

# Execute CloudFormation CLI
if [ $EXECUTION_MODE == "deploy" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $STACK_NAME.yml \
        --parameter-overrides file://$STACK_NAME.json \
        --capabilities CAPABILITY_NAMED_IAM \
        --region us-east-1
fi

if [ $EXECUTION_MODE == "delete" ]
then
    aws cloudformation delete-stack \
        --stack-name $STACK_NAME \
        --region us-east-1
fi

if [ $EXECUTION_MODE == "preview" ]
then
    aws cloudformation deploy \
        --stack-name $STACK_NAME \
        --template-file $STACK_NAME.yml \
        --parameter-overrides file://$STACK_NAME.json \
        --capabilities CAPABILITY_NAMED_IAM \
        --no-execute-changeset \
        --region us-east-1 
fi
