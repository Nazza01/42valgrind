# syntax = docker/dockerfile:1.2

FROM gcc:latest
LABEL version="5.0"
LABEL author="Nathanael"

RUN apt-get update && apt-get install -y \
	vim \
	valgrind \
	xorg \
	libxext-dev \
	libbsd-dev

RUN mkdir /code

WORKDIR /code

ARG TERM=xterm
ENV TERM=$TERM