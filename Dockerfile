# Use the official Python image from the Python 3.8.1 Alpine variant
FROM python:3.8.1-alpine

# Set the working directory in the container to /src
WORKDIR /src

# Copy the requirements file to the container at /src/requirements.txt
COPY ./requirements.txt /src/requirements.txt

# Install build dependencies and Python dependencies
RUN set -eux \
    # Install build dependencies
    && apk add --no-cache --virtual .build-deps build-base \
    libressl-dev libffi-dev gcc musl-dev python3-dev \
    # Upgrade pip, setuptools, and wheel
    && pip install --upgrade pip setuptools wheel \
    # Install Python dependencies from requirements.txt
    && pip install -r /src/requirements.txt \
    # Remove build dependencies to reduce image size
    && apk del .build-deps \
    # Clean up the pip cache
    && rm -rf /root/.cache/pip

# Copy the entire project to the container's /src directory
COPY . /src/

# Expose port 8000 to be able to access the application
EXPOSE 8000

# Run the FastAPI application using Uvicorn
CMD ["uvicorn", "app.main:app", "--reload", "--workers", "1", "--host", "0.0.0.0", "--port", "8000"]
