#!/bin/bash

# Check if the cluster name is provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <cluster_name>"
  exit 1
fi

# Extract cluster name from the argument
cluster_name=$1

# Get a list of all AWS regions
regions=$(aws ec2 describe-regions --output json | jq -r '.Regions[].RegionName')

# Iterate over each region and update kubeconfig
for region in $regions; do
  echo "Updating kubeconfig for cluster $cluster_name in region $region..."
  aws eks --region "$region" update-kubeconfig --name "$cluster_name"
done
