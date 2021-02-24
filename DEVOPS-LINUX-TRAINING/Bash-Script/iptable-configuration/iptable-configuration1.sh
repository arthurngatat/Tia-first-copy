#!/bin/bash

#------------------------------------------------------------------------------------------------------#
#					 Description: Firewall configuration			       #
#------------------------------------------------------------------------------------------------------#

usage() {
echo -e "\nThis script need two arguments, the port number and the protocol\nThe protocol most be lower case letters. It must be either tcp or udp\n"
echo -e "Exampe: $0 <port> <protocol>\n\n $0 80 tcp \n"
echo -e "OR\n"
echo -e "$0 8080 udp \n"
exit 1
}


## Check if port number a digit
case $1 in
	''|*[!0-9]*) 
	echo -e "\nPlease provide a valid port number\n"
	usage
	exit 2 
	;;
	*) echo $1 
	;;
esac

## Check if the protocol is a string and also check if the protocol is tcp or udp

if [[ $2 = *[!0-9]* ]] && [ "$2" = "tcp" ] || [ "$2" = "udp" ]
then
    echo "$2"
else
    echo "Please provide a valid protocol"
    usage
fi

## check if the protocol is tcp or udp

#if [ "$2" = "tcp" ] || [ "$2" = "udp" ]; then
#     echo "Entered $2"
#     exit 4
# lse
#    echo "Please provide a valid protocol"
#    usage
#fi

## Chech number of arguments

if [[ $# -ne 2 ]]
then
usage
fi

