#!/usr/bin/env bash
# Source: https://github.com/adammck/terraform-inventory/issues/121#issuecomment-749663776
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TERRAFORM_INVENTORY=`which terraform-inventory`
TF_STATE="$CURRENT_DIR/../../terraform/cloud-infra"    # <<== relative path to dir with .tfstate
"$TERRAFORM_INVENTORY" "$@" "$TF_STATE"
