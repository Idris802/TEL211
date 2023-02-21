arg_1=$1
arg_2=$2
arg_3=$3
arg_4=$4


inc=0

for arg in "$@"; do
	echo "$arg"${inc}
	((inc=inc+5))
done
