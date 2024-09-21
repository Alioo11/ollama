# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install required dependencies
RUN apt-get update && apt-get install -y curl unzip

# Install Ollama CLI
RUN curl -o ollama-installer.sh https://ollama.com/download.sh && \
    bash ollama-installer.sh && \
    mv ollama /usr/local/bin/ollama

# Install Flask for REST API
RUN pip install flask

# Download a specific model using Ollama
# For example, "llama2"
RUN ollama pull llama2

# Set the working directory in the container
WORKDIR /app

# Copy the API script into the container
COPY app.py /app/

# Expose the API port
EXPOSE 5000

# Run the Flask API
CMD ["python", "app.py"]