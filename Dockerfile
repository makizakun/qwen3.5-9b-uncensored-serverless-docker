# Start with the RunPod-optimized llama.cpp worker
FROM ghcr.io/jacob-ml/inference-worker:latest

# Install the downloading tool
RUN apt-get update && apt-get install -y curl

# Download the 5GB model straight from Hugging Face into the image
RUN mkdir -p /models && \
    curl -L -o /models/qwen.gguf "https://huggingface.co/HauhauCS/Qwen3.5-9B-Uncensored-HauhauCS-Aggressive/resolve/main/Qwen3.5-9B-Uncensored-HauhauCS-Aggressive-Q4_K_M.gguf"

# No CMD line needed! The jacob-ml worker handles the RunPod Serverless startup automatically.
