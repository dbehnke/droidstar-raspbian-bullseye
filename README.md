# droidstar-raspbian-bullseye

This project builds DroidStar debian package for use with Raspberry Pi OS based on bullseye.  It uses using docker buildx and qemu for emulation on a more faster PC.

If you don't want to build yourself, there is a debian package built in the Releases section.  It may be out of date and somewhat untested, you have been warned :)

See https://github.com/nostar/DroidStar for more information on DroidStar.

Mentioning again.. the binaries that are output will only work on the Bullseye variant of Raspberry Pi OS. They are dynamically linked to that OS only.

The skill level to build requires some knowledge of docker.  It's easier on a Mac using Docker for Desktop.  I have tested it both on an M1 mac and on Linux using Manjaro.

If you manage that, once your docker environment is set up, its run two shell scripts and hopefully done within about 15 minutes of compiling, plus another minute or two of running the second script. 

This does not build any of the plugins necessary to do dmr, ysf.. it's main intention is for M17.  Please don't ask me how/where to build the vocoder plugins. I have no knowledge.


## prerequisites

You need a working Docker environment that supports buildx and has the qemu static binaries installed

How this is accomplished is a little out of scope here, but some hints below.

If you are using Docker Desktop on a Mac, this should be included.

On Linux, it's a little tricker, you'd have to refer to how to do it on your distibution you are using.


### Archlinux Example

On Archlinux and Manjaro (that's what I'm using) you can follow the archwiki to set up your environment:

You'll want to scroll to the top to learn how to install docker.. but then this link for how to setup the qemu/buildx

https://wiki.archlinux.org/title/Docker#Using_buildx_for_cross-compiling

## building the binary

Assuming docker is setup properly, clone this repo and then run the following:

```
./1-build-docker-images.sh
./2-extract-droidstar.sh
```

The first script will make 3 docker images.. a base image, a qt development image, and finally an image that builds DroidStar and creates a debian package.

The second script will extract the debian package and put it in the project folder you ran the scripts from.

If all is sucessful, you should have a debian package.

## installing the created debian package

copy the debian package to your raspberry pi, change to the directory you put the deb file.

```
sudo dpkg -i droidstar*.deb; sudo apt install -f
```

## running droidstar

open up a shell, and type the command

```
/opt/DroidStar/bin/DroidStar
```

## TODO

make a .desktop and icon file so you don't have to run from terminal.

