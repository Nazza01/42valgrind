# 42valgrind

A gcc docker container which includes valgrind. Now with easier debugging inside a makefile!

Refer to the included makefile in this directory which copies over your code into the docker container

This docker container is based off of gcc:latest on docker hub, while also installng valgrind and any needed updates. It will also copy over any files in the current directory (wherever your makefile is as the rule uses it to make the current directory)

## Easy Usage
1. Refer to the included makefile in this directory which copies over your code into the docker container and does all the work for you (mostly!)

2. Add the rule `v` inside your makefile as per the Makefile included inside this repository
	You may also need to add a few variables as the valgrind rule will need it. (see the Variable explanation for the rules that are needed)

Prequisites: Make sure you have docker installed!

## Variable Explanation
Note: If you are not using the included makefile, you will need to set a variable for echo as my usual makefiles include a progress bar which is used alongside echo. Feel free to set the $(ECHO) variable to echo like so:
ECHO			= echo
Variable list:
VALGRND_NAME	= <containername>			//	The docker container name
LOG				= <logname>					//	The location of the logs (uses find utility or you can explicity name them)
NAME			= <program_name>			//	The program name
HDR_DIR			= <header/includes_dir>		//	The directory where your headers files are located (.h/.hpp)
SRC_DIR			= <sources>					//	The directory where your source files are located (.c/.cpp)

## Docker Container development (build & develop)
1. Download the files using git

`git clone https://github.com/Nazza01/42valgrind`

2. Build the docker image

`docker build -t temp/42val .`

3. Use the docker image to run the docker container

`docker run --name dev -dit temp/42val`

4. Attach to the docker container

`docker attach dev`

You will now be inside the docker container's terminal

The following command line utilites are installed:

## Valgrind - Memory leak checking 
Usage

`valgrind ./programname`

Please note that this project is a work in progress and may change over time.
