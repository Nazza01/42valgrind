# 42valgrind

WIP

A gcc docker container which includes valgrind

Refer to the included makefile in this directory which copies over your code into the docker container

## Easy Usage
1. Refer to the makefile inside this repository for setup within one of your makefiles:

1. Download the files

`git clone https://github.com/Nazza01/42valgrind`

2. Build the docker image

`docker build -t b/ftval .`

3. Use the docker image to run the docker container

`docker run --name ftval -dit b/ftval`

4. Attach to the docker container

`docker attach ftval`

You will now be inside the docker container's terminal

The following command line utilites are installed:

## Valgrind - Mmemory leak checking 
Usage

`valgrind ./programname`

This project is a work in progress and may change over time.
