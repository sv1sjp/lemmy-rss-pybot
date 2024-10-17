# Use an official lightweight Python image
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Ensure necessary files are present before proceeding
# This step checks that required files exist and stops the build process if they are missing
RUN test -f requirements.txt || (echo "Error: requirements.txt not found" && exit 1) && \
    test -f lemmy-rss-pybot.py || (echo "Error: lemmy-rss-pybot.py not found" && exit 1) && \
    test -f rss_feeds.json || (echo "Error: rss_feeds.json not found" && exit 1) && \
    test -f .env || (echo "Error: .env not found" && exit 1)

# Copy the requirements file to the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY lemmy-rss-pybot.py .
COPY rss_feeds.json .

# Copy the environment file
COPY .env .

# Run the application
ENTRYPOINT ["python", "lemmy-rss-pybot.py"]
