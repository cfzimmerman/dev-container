FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  curl \
  python3 \
  && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"


WORKDIR /home

CMD ["/bin/bash"]
