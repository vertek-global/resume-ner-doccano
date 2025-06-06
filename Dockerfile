FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    python3-dev \
    curl \
    git \
    gcc \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy entire repo contents
COPY . .

# Install backend dependencies
RUN pip install --upgrade pip
RUN pip install -r backend/requirements.txt

# ⬅️⬅️⬅️ NEW LINE: install Doccano from source
RUN pip install .

# Run Doccano
CMD ["doccano", "webserver", "--port", "8000"]
