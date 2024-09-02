# Dockerhub - docker 
FROM debian:bookworm-slim

# Set the working directory to /app
WORKDIR /app

# Install required packages for python 3
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip python3-dev build-essential python3-venv

# Remarque debian utilise une version fix pour lui meme créé un env.
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY . /app


RUN pip install -r requirements.txt


CMD ["python", "main.py"]


