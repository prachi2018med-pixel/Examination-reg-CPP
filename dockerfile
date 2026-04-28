# Use Ubuntu as the base
FROM ubuntu:22.04

# Prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install compiler and all required libraries
RUN apt-get update && apt-get install -y \
    g++ \
    libsqlite3-dev \
    libasio-dev \
    libboost-all-dev \
    cmake \
    git

# Setup workspace
WORKDIR /app
COPY . .

# Compile the application 
# Note: We don't need -lws2_32 on Linux (Render), just sqlite and pthread
RUN g++ main.cpp -o exam_app -lsqlite3 -lpthread

# Expose the port
EXPOSE 18080

# Run the app
CMD ["./exam_app"]