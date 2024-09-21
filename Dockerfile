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
    bash \
    && rm -rf /var/lib/apt/lists/*

# Dummy run command (e.g., an infinite loop)
CMD ["bash", "-c", "while true; do sleep 30; done"]

# RUN curl -O https://ollama.com/install.sh && \
#     chmod +x ollama-installer-linux && \
#     /bin/bash ./ollama-installer-linux

# RUN curl -fsSL https://ollama.com/install.sh | sh


# # Add Ollama to PATH (if necessary, adjust based on install location)
# ENV PATH="/usr/local/bin/ollama:$PATH"

# # Pull a specific LLM model using the Ollama CLI
# # Replace `llama2` with the actual name of the LLM model you want to pull
# RUN ollama pull llama2

# # Set working directory
# WORKDIR /app

# # Copy your project files to the container
# COPY . /app

# # Expose the port that Ollama will use to serve the model, if applicable
# EXPOSE 11434

# # Define the entry point for the container
# CMD ["ollama", "serve"]

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
