# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy the pyproject.toml and poetry.lock files to the container
COPY pyproject.toml poetry.lock /app/

# Install the dependencies
RUN poetry install --no-root --no-dev

# Copy the rest of the application code to the container
COPY . /app

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["poetry", "run", "uvicorn", "fastapi_docker.main:app", "--host", "0.0.0.0", "--port", "8000"]