#!/bin/bash 

#For declaring
declare -A same_month

#divisor=$(( 12-1+1 ))
select_month=$((RANDOM%12+1))				#Initialize the select_month variable
#Switch case started
case $select_month in
	1)
	month="January"
	;;
	2)
	month="February"
	;;
	3)
	month="March"
	;;
	4)
	month="April"
	;;
	5)
	month="May"
	;;
	6)
	month="June"
	;;
	7)
	month="July"
	;;
	8)
	month="August"
	;;
	9)
	month="September"
	;;
	10)
	month="October"
	;;
	11)
	month="November"
	;;
	12)
	month="December"
	;;
esac
echo "Individuals having birthdays on $month are: "
j=0							#Initialize the j variable to given value 0
for (( i=1;i<=50;i=$i+1 ))				#For loop started
do
	#divisor1=$(( 12-1+1 ))
	birth_month=$((RANDOM%12+1))			#Initialize birth_month variable and save the value of select_month

	if (( $birth_month==$select_month ))		#If loop started and checking the condition
	then
		over1=1					#Initialize the over1 variable
		while (( $over1!=0 ))
		do
			same_month[$j]="Individual : "$i" "
			j=$(( $j+1 ))
			over1=0
		done
	fi
done
echo ${same_month[@]}					#Print the same month
