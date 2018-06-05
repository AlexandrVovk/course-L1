#!/usr/bin/env bash

loop ()
{ 
echo "OK, you are root."

if [ -e /root/crack.txt ]

	then rm /root/crack.txt

fi

	for i in `cat /etc/shadow`

	do 

		echo $i | egrep -v "\*|!" | awk -F":" '{print $1 ":" $2}' >> /root/crack.txt

	done
}

flag=0

while [ $flag != 1 ]

do

read -p "Do you want to use a file /etc/shadow ? [ Y / N ]: " question

	case "$question" in 

	y | Y) if [ `whoami` = root ]

			then loop
		
				if [ -s /root/crack.txt ]

					then echo "Done. Look at that file /root/crack.txt"

					else echo "File crack.txt doesn't exist. Exit" 
	
				fi

				flag=1

			else	echo "You are not root. Exit"; flag=1

		fi 
	;;

	n | N) echo "Exit"; flag=1

	;;

	*) echo "You type something wrong. Try again" 

	;;

	esac

done


exit 0
