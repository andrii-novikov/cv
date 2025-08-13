#!/bin/bash

# README Date Check Script
# This script checks if README.md has been modified and validates the "Last updated:" date

if git diff --cached --name-only | grep -q "README\.md"; then
    echo "README.md has been modified. Checking \"Last updated:\" date..."
    current_date=$(LC_TIME=C date "+%B %Y")
    
    if grep -q "Last updated: $current_date" README.md; then
        echo "✅ README.md \"Last updated:\" date is current: $current_date"
    else
        echo "❌ ERROR: README.md \"Last updated:\" date is not current!"
        echo "   Expected: $current_date"
        echo "   Please update the \"Last updated:\" line in README.md to: \"Last updated: $current_date\""
        echo ""
        echo "   Current \"Last updated:\" line in README.md:"
        grep "Last updated:" README.md || echo "   No \"Last updated:\" line found"
        echo ""
        echo "   Please fix this before committing."
        exit 1
    fi
else
    echo "README.md not modified, skipping date check."
fi
