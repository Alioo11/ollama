
# Use an official Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables to avoid prompts during installations
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download and install Ollama
# Adjust the URL to point to the correct location if Ollama provides one
RUN curl -O https://ollama.com/download/ollama-installer-linux && \
    chmod +x ollama-installer-linux && \
    ./ollama-installer-linux

# Add Ollama to PATH (if necessary, adjust based on install location)
ENV PATH="/usr/local/bin/ollama:$PATH"

# Pull a specific LLM model using the Ollama CLI
# Replace `model-name` with the actual name of the LLM model you want to pull
RUN ollama pull llama2

# Set working directory
WORKDIR /app

# Copy your project files to the container
COPY . /app

# Expose the port that Ollama will use to serve the model, if applicable
EXPOSE 11434

# Define the entry point for the container
# Assuming Ollama runs a server or needs to be invoked via CLI
CMD ["ollama", "serve"]

# # Use an official Python runtime as a parent image
# FROM python:3.9-slim

# # Install required dependencies
# RUN apt-get update && apt-get install -y curl unzip

# # Install Ollama CLI
# RUN curl -fsSL https://ollama.com/install.sh | sh


# # Install Flask for REST API
# RUN pip install flask

# # Download a specific model using Ollama
# # For example, "llama2"
# RUN ollama pull llama2

# # Set the working directory in the container
# WORKDIR /app

# # Copy the API script into the container
# COPY app.py /app/

# # Expose the API port
# EXPOSE 5000

# # Run the Flask API
# CMD ["python", "app.py"]
