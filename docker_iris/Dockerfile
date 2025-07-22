# 1. Use official Python base image
FROM python:3.10-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy files into the container
COPY . /app

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Expose the FastAPI port
EXPOSE 8000

# 6. Command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
