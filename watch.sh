#!/bin/sh

DIR=$1;
inotifywait -me close_write,moved_to,create $DIR |
while read -r directory events filename; do
	   echo "Compiling bro";
	   #run command here
done

