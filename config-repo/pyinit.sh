#!/bin/bash

# Step 1: Initialize project
uv init

# Step 2: Remove default files
rm pyproject.toml
rm .gitignore
rm main.py

# Step 3: Copy custom files
cp ~/config-repo/pyproject.toml pyproject.toml
cp ~/config-repo/gitignore_template .gitignore
cp ~/config-repo/dockerignore_template .dockerignore
cp ~/config-repo/docker_template Dockerfile
cp ~/config-repo/mkdocs_template mkdocs.yml

# Step 4: Create a new main.py file
mkdir src && touch src/main.py

# Step 5: Create directory structure
mkdir tests
mkdir logs
mkdir -p docs/reference
echo "# Project Documentation" > docs/index.md
echo "::: src.main" > docs/reference/main.md

# Step 6: Create virtual environment
uv venv

# Step 7: Activate virtual environment
source .venv/bin/activate

# Step 8: Install dependencies
uv sync

echo "✔️ uv project initialized"
