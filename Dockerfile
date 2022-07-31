# syntax = docker/dockerfile:1.2

FROM gcc:latest
LABEL version="4.0"
LABEL author="Nathanael"

RUN apt-get update && apt-get install -y \
	valgrind

RUN mkdir /code

WORKDIR /code

ARG TERM=xterm
ENV TERM=$TERM