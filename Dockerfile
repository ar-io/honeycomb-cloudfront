FROM ubuntu:20.04

RUN apt-get update

ARG HONEYAWS_VERSION=1.4.3
ARG HONEYAWS_SHA256=c2dd79fec9e2346568de562dd790fd1e474a62fed3a6d3d21e8f1b3472b03418
RUN apt-get install -y wget \
    && wget -q https://honeycomb.io/download/honeyaws/v${HONEYAWS_VERSION}/honeyaws_${HONEYAWS_VERSION}_amd64.deb \
    && apt-get remove -y wget \
    && apt-get autoremove -y \
    && apt-get clean \
    && echo "${HONEYAWS_SHA256}  honeyaws_${HONEYAWS_VERSION}_amd64.deb" | sha256sum -c \
    && dpkg -i honeyaws_${HONEYAWS_VERSION}_amd64.deb \
    && rm honeyaws_${HONEYAWS_VERSION}_amd64.deb

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
