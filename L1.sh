#!/usr/bin/env bash

loop ()
{ 








echo "this is function"
}


read -p "Do you want to look throught a file /etc/shadow ? [ Y / N ]: " question

case "$question" in 

	y | Y) if [ `whoami` = root ]

			then loop

			else	echo "You are not root, exit"; exit 0

		fi 
	;;

	n | N) echo "Exit"; exit 0

	;;

	*) echo "Something Exit"; exit 0

	;;

esac

exit 0

			
