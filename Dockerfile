# Base Image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt /app/requirements.txt

# Install system dependencies and Python dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the code to the container
COPY . /app

# Expose the port your app runs on
EXPOSE 5000

# Command to run your app
CMD ["python", "app.py"]
