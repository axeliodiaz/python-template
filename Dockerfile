# syntax=docker/dockerfile:1
FROM python:3.12-slim

# Prevents Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
# Ensures logs are flushed immediately
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies (optional, minimal)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements/base.txt ./requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . .

# Default command (runs pytest by default)
CMD ["pytest", "-q"]