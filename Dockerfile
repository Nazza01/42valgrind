# syntax = docker/dockerfile:1.2

FROM gcc:latest
LABEL version="2.0"
LABEL author="Nathanael"

RUN apt-get update && apt-get install -y \
	valgrind

WORKDIR /code

RUN mkdir /code

COPY sources /code/sources
COPY headers /code/headers
COPY libraries /code/libraries
COPY Makefile /code/Makefile

