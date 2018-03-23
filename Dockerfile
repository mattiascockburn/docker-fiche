## Build Phase
FROM ubuntu:16.04 as build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y gcc git make \
    && git clone https://github.com/solusipse/fiche.git \
    && cd fiche \
    && CFLAGS=-static make \
    && make install


## Deployment
FROM busybox:latest
LABEL maintainer Mattias Giese <mattiasgiese@posteo.net>
ENV DOMAIN=example.com
ENV SLUGS=6
ENV ADDITIONAL_ARGS=-S
RUN adduser -S -D -h /data fiche
COPY --from=build /usr/local/bin/fiche /
USER fiche
EXPOSE 9999
VOLUME /data
ENTRYPOINT /fiche -o /data -s $SLUGS -d $DOMAIN $ADDITIONAL_ARGS
