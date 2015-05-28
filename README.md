docker-byond
===============

Byond in docker, with git.

## Usage:
```docker run -t --name <container name> -v <storage path>/gobyond.sh:/usr/local/bin/gobyond.sh:ro -v <storage path>/data:/home/byond -p <port>:<port> boggart/docker-byond```

## Sample startwine.sh:
```#!/bin/sh
bname="My Byond Game"

echo "Do stuff like update the game and restore your config files here."

while :
do
	echo "[$bname]: Starting."
    DreamDaemon --help
done
echo "[$wname]: Exiting."```