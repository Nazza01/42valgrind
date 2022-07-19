# syntax = docker/dockerfile:1.2

FROM gcc:latest
LABEL version="1.0"
LABEL author="Nathanael"

RUN apt-get update && apt-get install -y \
	valgrind

RUN mkdir /usr/code

COPY ex00/sources /usr/code/sources
COPY ex00/headers /usr/code/headers
COPY ex00/libraries /usr/code/libraries
COPY ex00/Valgrind.mk /usr/code/Makefile

WORKDIR /usr/code
