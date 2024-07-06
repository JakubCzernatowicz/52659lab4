#!/bin/bash

case "$1" in
    --date|-d)
        date
        ;;
    --logs|-l)
        num_files=${2:-100}
        mkdir -p logs
        for i in $(seq 1 $num_files); do
            echo -e "File name: log$i.txt\nScript name: $0\nDate: $(date)" > logs/log$i.txt
        done
        ;;
    --help|-h)
        echo "Available options:"
        echo "--date, -d       Display current date"
        echo "--logs [n], -l [n]   Create n log files (default: 100)"
        echo "--help, -h       Show this help message"
        ;;
    --init)
        git clone https://github.com/JakubCzernatowicz/52659lab4.git $(pwd)
        export PATH=$PATH:$(pwd)/52659lab4
        ;;
    --error|-e)
        num_files=${2:-100}
        mkdir -p errors
        for i in $(seq 1 $num_files); do
            echo -e "File name: error$i.txt\nScript name: $0\nDate: $(date)" > errors/error$i.txt
        done
        ;;
    *)
        echo "Invalid option. Use --help or -h for usage."
        ;;
esac

