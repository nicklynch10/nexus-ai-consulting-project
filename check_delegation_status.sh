#!/bin/bash

echo "Checking delegation status..."

echo "=== Delegation Files ==="
ls -la delegation/

echo -e "\n=== Delegation Success Files ==="
ls -la /shared/delegation_success_*.txt 2>/dev/null || echo "No delegation success files found"

echo -e "\n=== Task Completed Files ==="
ls -la /shared/task_completed_*.txt 2>/dev/null || echo "No task completed files found"

echo -e "\n=== Agent Status ==="
curl -s http://localhost:8000/agent-status 2>/dev/null || echo "Agent status service not available"

echo -e "\n=== Project Branches ==="
git branch -r