#!/bin/bash

echo "=== NEXUS AI CONSULTING PROJECT SETUP VERIFICATION ==="

echo -e "\n1. REPOSITORY STATUS"
echo "-------------------"
git remote -v
git branch -a

echo -e "\n2. FILE STRUCTURE"
echo "-----------------"
find . -type f -not -path "./.git/*" | sort

echo -e "\n3. DELEGATION FILES"
echo "-------------------"
ls -la delegation/

echo -e "\n4. DOCUMENTATION"
echo "----------------"
echo "README.md:"
head -5 README.md
echo -e "\nCONTRIBUTING.md:"
head -5 CONTRIBUTING.md
echo -e "\nDEVELOPMENT_PLAN.md:"
head -5 DEVELOPMENT_PLAN.md

echo -e "\n5. BRANCH VERIFICATION"
echo "----------------------"
git branch -r | grep -E "(main|development|feature)" | sort

echo -e "\n6. RECENT COMMITS"
echo "-----------------"
git log --oneline -10

echo -e "\n=== SETUP VERIFICATION COMPLETE ==="
echo "Project is ready for multi-agent development!"