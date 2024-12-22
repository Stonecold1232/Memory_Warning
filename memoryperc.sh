while :
do
	memoryUsed=`free -m | head -2 | tail -1 | awk '{ print $3 }'`
	totalMemory=`free -m | head -2 | tail -1 | awk '{ print $2 }'`

	usedMemPerc=`expr $memoryUsed \* 100 / $totalMemory`

	echo -e "`date +"%r %D"`\t$usedMemPerc" >> memoryReport.tsv\
	
	if [[ $usedMemPerc -ge 80 ]]
	then
		echo "Security alarm for memory" | espeak-ng
		exit
	fi

	sleep 5
done

