r=$(( RANDOM % 10 ))


while [[ ${arg} -ne ${r} ]]; do
	read -p  "Guess a number between 0 and 10: " arg
	
	diffm1="$(($arg-1))"
	diffp1="$(($arg+1))"

	diffm2="$(($arg-2))"
	diffp2="$(($arg+2))"

	if [ $diffm2 -eq ${r} ] || [ $diffm1 -eq ${r} ]; then 
		echo "Try a lower number!"
	elif [ $diffp2 -eq ${r} ] || [ $diffp1 -eq ${r} ]; then 
		echo "Try a higher number!"	
	fi

	echo
done

echo "Yes guessed it right the number is ${r}"
exit 1
