#!/bin/bash

# Basic AWS Upload Script for Nexus AI Consulting Website

# Set variables
BUCKET_NAME="nexus-ai-consulting-$(date +%s)"  # Unique bucket name with timestamp
REGION="us-east-1"

echo "=== Nexus AI Consulting AWS Upload ==="
echo "Creating S3 bucket: $BUCKET_NAME"

# Create S3 bucket
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Build the React app
echo "Building React application..."
npm run build

# Sync build files to S3 bucket
echo "Uploading files to S3 bucket..."
aws s3 sync build/ s3://$BUCKET_NAME --delete

echo "=== Upload Complete ==="
echo "Files have been uploaded to S3 bucket: $BUCKET_NAME"
echo ""
echo "To manually configure website hosting:"
echo "1. Go to AWS S3 Console"
echo "2. Select your bucket: $BUCKET_NAME"
echo "3. Go to Properties tab"
echo "4. Enable 'Static website hosting'"
echo "5. Set Index document to 'index.html'"
echo "6. Set Error document to 'index.html'"
echo "7. Save changes"
echo ""
echo "Then, to make the website publicly accessible:"
echo "1. Go to Permissions tab"
echo "2. Edit 'Block public access' and uncheck 'Block all public access'"
echo "3. Add the following bucket policy in 'Bucket policy':"
echo ""
echo "{"
echo "  \"Version\": \"2012-10-17\","
echo "  \"Statement\": ["
echo "    {"
echo "      \"Sid\": \"PublicReadGetObject\","
echo "      \"Effect\": \"Allow\","
echo "      \"Principal\": \"*\","
echo "      \"Action\": \"s3:GetObject\","
echo "      \"Resource\": \"arn:aws:s3:::$BUCKET_NAME/*\""
echo "    }"
echo "  ]"
echo "}"
echo ""
echo "After these steps, your website will be available at:"
echo "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"