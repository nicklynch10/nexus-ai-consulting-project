#!/bin/bash

# Simple AWS Deployment Script for Nexus AI Consulting Website

# Set variables
BUCKET_NAME="nexus-ai-consulting-$(date +%s)"  # Unique bucket name with timestamp
REGION="us-east-1"

echo "=== Nexus AI Consulting AWS Deployment ==="
echo "Creating S3 bucket: $BUCKET_NAME"

# Create S3 bucket
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Build the React app
echo "Building React application..."
npm run build

# Sync build files to S3 bucket
echo "Uploading files to S3 bucket..."
aws s3 sync build/ s3://$BUCKET_NAME --delete

# Set individual file permissions for public read access
echo "Setting public read access for files..."
aws s3api put-object-acl --bucket $BUCKET_NAME --key index.html --acl public-read
aws s3api put-object-acl --bucket $BUCKET_NAME --key asset-manifest.json --acl public-read
aws s3api put-object-acl --bucket $BUCKET_NAME --key static/css/main.525e3ce5.css --acl public-read
aws s3api put-object-acl --bucket $BUCKET_NAME --key static/css/main.525e3ce5.css.map --acl public-read
aws s3api put-object-acl --bucket $BUCKET_NAME --key static/js/main.c1f26288.js --acl public-read
aws s3api put-object-acl --bucket $BUCKET_NAME --key static/js/main.c1f26288.js.map --acl public-read
aws s3api put-object-acl --bucket $BUCKET_NAME --key static/js/main.c1f26288.js.LICENSE.txt --acl public-read

# Enable static website hosting
echo "Enabling static website hosting..."
aws s3 website s3://$BUCKET_NAME --index-document index.html --error-document index.html

# Get website URL
WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

echo "=== Deployment Complete ==="
echo "Website URL: $WEBSITE_URL"
echo "Note: It may take a few minutes for the website to be accessible."

echo "Deployment script completed successfully!"