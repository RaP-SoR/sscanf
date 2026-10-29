FROM ubuntu:24.04
RUN \
    dpkg --add-architecture i386 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        cmake \
        ninja-build \
        clang \
        g++-multilib \
        gcc-multilib \
        libstdc++-dev:i386 \
    && \
    useradd -m user

USER user

ENV CC=/usr/bin/clang \
    CXX=/usr/bin/clang++

COPY docker-entrypoint.sh /
CMD /docker-entrypoint.sh
