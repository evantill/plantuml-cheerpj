ARG BASE_IMAGE=debian:11.6-slim@sha256:98d3b4b0cee264301eb1354e0b549323af2d0633e1c43375d0b25c01826b6790

FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2023-03-10
# Run as "root" for system installation.

USER root

RUN apt-get update \
 && apt-get -y install \
      python3 \
      python3-pip \
      wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# install cheerpj
ARG CHEERPJ_URL="https://d3415aa6bfa4.leaningtech.com/cheerpj_linux_2.3.tar.gz"
ARG CHEERPJ_TAR="cheerpj_linux_2.3.tar.gz"
ENV CHEERPJ_DIR=/opt/cheerpj

RUN mkdir -p /tmp/cheerpj/cheerpj && \
    cd /tmp/cheerpj && \
    wget "$CHEERPJ_URL" && \
    tar -xvf "$CHEERPJ_TAR" -C cheerpj --strip-components 1 && \
    mv cheerpj /opt && \
    rm "$CHEERPJ_TAR"

ENV PATH "$PATH:/opt/cheerpj"

# Copy files from repository.

COPY ./rootfs /

# Make non-root container.

RUN groupadd --gid 1001 app && \
    useradd --uid 1001 --gid app --home /app app && \
    chown -R app:app /app

USER 1001

# Runtime execution.

WORKDIR /app

ENTRYPOINT [ "/opt/cheerpj/cheerpjfy.py" ]
