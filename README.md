# ftval

WIP

A gcc docker container which includes libreadline-dev, lldb and valgrind

This docker container copies over the directories contained inside the current directory
(git clone into a project folder which has a sources, headers, libraries and Makefile)

## Usage & Steps
1. Download the files

`git clone https://github.com/Nazza01/ftval`

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

## Readline
### Usage: Usable inside your C file as well as header file so minishell (& other projects) can work
libreadline-dev - readline function for C library to work inside the linux docker container

## lldb
### Usage: allows for easier debugging for your code

This project is a work in progress and may change over time.
