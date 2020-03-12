#!/bin/bash

echo -e "Please enter a poker hand in the form: \n Ah5d"
echo -e "Please note that all cards are represented as their standard notation, with 10 as T"
echo -e "All suits are also represented by the first letter of its respective word ex: spades = s"

read hand

read -a HANDARR <<< $(echo $hand | sed 's/./& /g')

case "${HANDARR[0]}" in
A)
	case "${HANDARR[2]}" in
	A) 
		echo "Play aggressive, you have the best hand! Go win!"
		;;
	K)
		echo "Play aggressive, you either win a lot or lose a lot!"
		;;	
	Q|J|T) 
		echo "Open from any position, great hand to continue and rep range"
		;;
	2|3|4|5)
		echo "Open from late positions, you have playability!"
		;;
	*)
		if [ ${HANDARR[1]} == ${HANDARR[3]} ]
		then 
			echo "Open with caution, these hands seem better than they are, but if you hit your flush, you likely have the nuts!"
		else 
			echo "Defend in BB or raise in SB, open on button if short handed, else this is a fold! Not all Aces are good!"
		fi 
		;;
	esac
	;;
K)
	case "${HANDARR[2]}" in
	K) 
		echo "Play aggressive, you have the second best hand! Go win!"
		;;
	A)
		echo "Play aggressive, you either win a lot or lose a lot!"
		;;
	Q|J|T) 
		echo "Open from any position, great hand to continue and rep range"
		;;
	*)
		if [ ${HANDARR[1]} == ${HANDARR[3]} ]
		then 
			echo "Open with caution on Button or defend on blinds!"
		else 
			echo "Fold please, bad hands!"
		fi 
		;;
	esac
	;;
Q)
	case "${HANDARR[2]}" in
	Q) 
		echo "Play aggressive, you have the third best hand! Go win!"
		;;
	A)
		echo "Play aggressive, you either win a lot or lose a lot!"
		;;
	K|J|T|9|8) 
		echo "Open from any position, great hand to continue and rep range"
		;;
	i*)
		echo "Fold please, bad hands!"
		;;
	esac
	;;
J)
	case "${HANDARR[2]}" in
	J) 
		echo "Play aggressive, you have a great paired hand! Go win!"
		;;
	A|K|Q|9) 
		echo "Open from any position, great hand to continue and rep range"
		;;
	T)
		echo "This is my favorite hand, if its suited, get at it!"
		;;
	*)
		echo "Fold please, bad hands!"
		;;
	esac
	;;
T)
	case "${HANDARR[2]}" in
	T) 
		echo "Play aggressive but with some caution when facing aggression"
		;;
	A|K|Q|9|8) 
		echo "Open from any position, great hand to continue and rep range"
		;;
	J)
		echo "This is my favorite hand, if its suited, get at it!"
		;;
	*)
		echo "Fold please, bad hands!"
		;;
	esac
	;;
*)
	case "${HANDARR[2]}" in
	A) 
		if [ ${HANDARR[1]} == ${HANDARR[3]} ]
		then 
			echo "Open with caution, these hands seem better than they are, but if you hit your flush, you likely have the nuts!"
		else 
			echo "Defend in BB or raise in SB, open on button if short handed, else this is a fold! Not all Aces are good!"
		fi 
		;;
	*)
		if [ ${HANDARR[0]} == ${HANDARR[2]} ]
		then
			echo "Middling/Low pocket pairs are perfect to set mine! Play them!"
		elif [[ ${HANDARR[0]}-${HANDARR[2]} == 1 ]]
		then 
			echo "Connectors are good, look at values and suits tho"
		elif [[ ${HANDARR[0]}-${HANDARR[2]} == -1 ]]
		then
			echo "Connectors are good, look at values and suits tho"
		else 
			echo "just fold unless you want to mix your strategy up (recommended)" 	
		fi
		;;
	esac
	;;
esac	 
