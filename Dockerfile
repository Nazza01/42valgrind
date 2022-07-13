# syntax = docker/dockerfile:1.2

FROM gcc:latest
LABEL version="1.0"
LABEL author="Nathanael"

RUN apt-get update && apt-get install -y \
	libreadline-dev \
	lldb \
	valgrind

RUN mkdir /usr/code

COPY sources /usr/code/sources
COPY headers /usr/code/headers
COPY libraries /usr/code/libraries
COPY Valgrind.mk /usr/code/Makefile

WORKDIR usr/code
