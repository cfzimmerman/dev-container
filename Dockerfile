FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /home

CMD ["/bin/bash"]
