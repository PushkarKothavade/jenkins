#!/bin/bash

if [ "$1" = "--help" ] ; then
  echo "Usage: ./encryption.sh <ami_id> <source_region> <destination_region> <new_image_name>"
  echo "Example: ./encryption.sh ./encryption.sh us-east-2 us-east-2 app_image"
  exit 0
fi

if [ "$#" -eq 4 ] ; then
  ami_id=$1
  source_region=$2
  destination_region=$3
  new_image_name=$4
  key_arn="arn:aws:kms:us-east-2:576660391185:key/b1fbead7-05c8-4788-a1e6-f1aa77cb26a0"

  aws ec2 copy-image --source-region $source_region --source-image-id $ami_id --region $destination_region --name $new_image_name --encrypted --kms-key-id $key_arn

  if [ "$?" -eq 0 ] ; then
    echo "Script executed successfully"
  else
    echo "Script was not successful"
  fi

else
  echo "Arguments are not equals to 4, Please enter correct arguments"
  exit 1
fi

