#!/bin/bash

# Step 1: Initialize project
uv init

# Step 2: Remove default files
rm pyproject.toml
rm .gitignore
rm main.py

# Step 3: Download your custom files
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/pyproject.toml -o pyproject.toml
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/gitignore_template -o .gitignore
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/dockerignore_template -o .dockerignore
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/docker_template -o Dockerfile
curl -sSL https://raw.githubusercontent.com/rquintero93/rq-configs/main/mkdocs_template -o mkdocs.yml

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

# Step 7: Activate virtual environment (POSIX-compatible)
source .venv/bin/activate

# Step 8: Install dev dependencies
uv sync

echo "✔️ uv project initialized"
