FROM ubuntu:20.04

RUN apt-get update

ARG HONEYAWS_VERSION=1.4.2
ARG HONEYAWS_SHA256=3e34929399baff4aa789ae395d9ca14a3cb2696334f80f782301620fb2fd12fb
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
