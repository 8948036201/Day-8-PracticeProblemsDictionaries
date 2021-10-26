#! /bin/bash -x

#Initialize the variable diceResult
diceResult=(0 0 0 0 0 0 0)

#Making the Function rollDice
function rollDice() {
    echo $((RANDOM%6+1))
}

#Making the function findMaxMinDice
function findMaxMinDice() {
resultDice=("$@")			#Initialization of resultDice variable
max=${resultDice[1]}			#Initialization of max variable and save the value of resultDice
maxDice=1				#Initialization of maxDice variable to 1
min=${resultDice[1]}			#Initialization of min variable and save the value of resultDice
minDice=1				#Initialization of minDice variable to 1
for ((counter=2; counter < ${#resultDice[@]} ; counter++))		#For loop started with condition
do
    if [ $max -lt ${resultDice[$counter]} ]
    then
        max=${resultDice[$counter]}
        maxDice=$counter
    fi

    if [ $min -gt ${resultDice[$counter]} ]
    then
        min=${resultDice[$counter]}
        minDice=$counter
    fi
done
#Print the value of maxDice and minDice
echo "Dice with max times $maxDice and min times $minDice "

}

#Making the function checkMaxDiceTimes
function checkMaxDiceTimes() {
    prevResult=$1						#Initialization of prevResult variable
    if [  $prevResult -eq 10 ]
    then
        isPresentMax=1
    else
        isPresentMax=0
    fi

    echo $isPresentMax
}
#While loop started
while ((1))
do
    dice=$(rollDice)							#initialize the variable dice and it the value of rollDice
    if [[ $( checkMaxDiceTimes ${diceResult[$dice]} ) -eq 1 ]]		#Function checkMaxDiceTimes calling in this line and checking condition
    then
        break
    else
        diceResult[((dice))]=$((diceResult[((dice))]+1))
        if [[ $( checkMaxDiceTimes ${diceResult[$dice]} ) -eq 1 ]]	#Function checkMaxDiceTimes Calling in this line and checking condition
        then
            break
        fi
    fi
done
echo "Dice Roll Times \n"						#Print the Dice Roll Times
for i in " ${!diceResult[@]}"						#For loop started for diceResult
do
    echo "$i:${diceResult[$i]}"						#Print the value of i and diceResult
done
findMaxMinDice ${diceResult[@]}						#Function findMaxMinDice calling here
