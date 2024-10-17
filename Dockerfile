# Use an official lightweight Python image
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt /app/

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python script into the container
COPY lemmy-rss-pybot.py /app/

# Set the default command to run the bot
ENTRYPOINT ["python", "/app/lemmy-rss-pybot.py"]
