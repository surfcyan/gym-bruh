#!/bin/bash
echo "Running script...."
while getopts ":c:" opt; do
    case $opt in
        c)
            echo "-a was triggered, Parameter: $OPTARG" >&2
            echo "creating component.." >&2
            touch "lib/screens/$OPTARG/$OPTARG.dart"
            touch "lib/screens/$OPTARG/$OPTARG-logic.dart"
            echo "Done!" >&2
        ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
        ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
        ;;
    esac
done