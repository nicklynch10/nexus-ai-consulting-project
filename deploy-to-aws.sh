#!/bin/bash

# AWS Deployment Script for Nexus AI Consulting Website

# Set variables
BUCKET_NAME="nexus-ai-consulting-$(date +%s)"  # Unique bucket name with timestamp
REGION="us-east-1"

echo "=== Nexus AI Consulting AWS Deployment ==="
echo "Creating S3 bucket: $BUCKET_NAME"

# Create S3 bucket
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Configure bucket for static website hosting
aws s3 website s3://$BUCKET_NAME --index-document index.html --error-document index.html

# Build the React app
echo "Building React application..."
npm run build

# Sync build files to S3 bucket
echo "Uploading files to S3 bucket..."
aws s3 sync build/ s3://$BUCKET_NAME --delete

# Set bucket policy for public read access
echo "Setting bucket policy for public access..."

cat > bucket-policy.json << EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
    }
  ]
}
EOF

aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://bucket-policy.json

# Enable static website hosting
echo "Enabling static website hosting..."
aws s3 website s3://$BUCKET_NAME --index-document index.html --error-document index.html

# Get website URL
WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

echo "=== Deployment Complete ==="
echo "Website URL: $WEBSITE_URL"
echo "Note: It may take a few minutes for the website to be accessible."

# Clean up
rm bucket-policy.json

echo "Deployment script completed successfully!"