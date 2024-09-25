FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  build-essential \
  apt-utils \
  linux-tools-generic \
  git \
  curl \
  python3 \
  valgrind \
  && rm -rf /var/lib/apt/lists/*

RUN bash -c 'apt-get install -y linux-tools-common linux-tools-generic && \
  # symlink proper linux tools to the perf shortcut \
  cd /usr/lib/linux-tools && \
  cd `ls -1 | head -n1` && \
  rm -f /usr/bin/perf && \
  ln -s `pwd`/perf /usr/bin/perf && \
  ln -s /usr/bin/python3.9 /usr/bin/python'

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /home

CMD ["/bin/bash"]
