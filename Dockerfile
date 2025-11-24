# Use official PyTorch image with CUDA 12.4 (closest to 12.6)
FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-devel

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ /app/src/
COPY handler.py /app/

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512

# Run the handler
CMD ["python", "handler.py"]
