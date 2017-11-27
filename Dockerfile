FROM alpine:latest

RUN apk update && apk add ca-certificates wget && update-ca-certificates

RUN mkdir /opt

# From https://s3-us-west-2.amazonaws.com/alpine-ghc/
ADD https://s3-us-west-2.amazonaws.com/alpine-ghc/7.10/x86_64/ghc-7.10.3-r0.apk /opt/ghc-7.10.3-r0.apk

RUN apk add --allow-untrusted /opt/ghc-7.10.3-r0.apk

# https://github.com/commercialhaskell/stack/releases
ADD https://github.com/commercialhaskell/stack/releases/download/v1.5.1/stack-1.5.1-linux-x86_64-static.tar.gz /opt/stack-1.5.1-linux-x86_64-static.tar.gz

RUN cd /opt && tar -xvzf stack-1.5.1-linux-x86_64-static.tar.gz
RUN mv /opt/stack-1.5.1-linux-x86_64-static/stack /usr/local/bin/stack


# clean
RUN rm /opt/ghc-7.10.3-r0.apk
RUN rm -rf /opt/stack-1.5.1-linux-x86_64-static
