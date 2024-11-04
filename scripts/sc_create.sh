#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: myscicat <command> <subcommand> [options]"
fi

subcommand=$1
shift

case "$subcommand" in
	dataset)
		/app/scripts/sc_dataset.sh "$@"
		;;
    	origdatablock)
        	/app/scripts/sc_origdatablock.sh "$@"
        	;;
	*)
		echo "Unknown subcommand: $subcommand"
		echo "Usage: myscicat <command> <subcommand> [options]"
		;;
esac
