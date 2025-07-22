# Dockerfile

# ---- Builder Stage ----
FROM python:3.10-slim AS builder

WORKDIR /app

# Install poetry for dependency management
RUN pip install poetry

# Copy only dependency files to leverage Docker cache
COPY poetry.lock pyproject.toml ./

# Install dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-root

# ---- Final Stage ----
FROM python:3.10-slim

WORKDIR /app

# Create a non-root user for security
RUN useradd -m -u 1000 appuser
USER appuser

# Copy installed packages from the builder stage
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /app /app

# Copy your application code and model
COPY ./fast_iris/main.py .
COPY ./fast_iris/model.joblib .

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
