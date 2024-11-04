#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: myscicat <command> [options]"
	echo "Commands:"
    	echo "  create     Create a dataset"
    	echo "  delete     Delete a dataset"
fi

command=$1
shift

case "$command" in
	delete)
		/app/scripts/sc_delete.sh "$@"
		;;
    	create)
        	/app/scripts/sc_create.sh "$@"
        	;;
	*)
		echo "Unknown command: $command"
		echo "Usage: myscicat <command> [options]"
		;;
esac
