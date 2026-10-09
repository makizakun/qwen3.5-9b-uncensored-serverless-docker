# Start with the official llama.cpp base
FROM ghcr.io/ggml-org/llama.cpp:server-cuda

# Install the downloading tool
RUN apt-get update && apt-get install -y curl

# Download the 5GB model straight from Hugging Face into the image
RUN mkdir -p /models && \
    curl -L -o /models/qwen.gguf "https://huggingface.co/HauhauCS/Qwen3.5-9B-Uncensored-HauhauCS-Aggressive/resolve/main/Qwen3.5-9B-Uncensored-HauhauCS-Aggressive-Q4_K_M.gguf"

# Set the startup command for RunPod
CMD ["--model", "/models/qwen.gguf", "--host", "0.0.0.0", "--port", "8000"]
