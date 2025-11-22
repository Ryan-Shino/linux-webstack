FROM python:3.12-slim

# Set workign directory
WORKDIR /app

# Copy source code
COPY src/ /app

# Install flask
RUN pip install flask

# Expose port
EXPOSE 5000

# Run app
CMD ["python","app.py"]
