#!/bin/bash

# Install necessary tools if not already installed
if ! command -v lynx &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y lynx
fi

# Fetch the entire Buildroot manual
curl -s https://buildroot.org/downloads/manual/manual.html -o manual.html

# Convert HTML to plain text and summarize
lynx -dump -nolist manual.html > manual.txt
head -n 500 manual.txt > summary.txt

# Output the summarized content
cat summary.txt