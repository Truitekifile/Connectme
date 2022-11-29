@echo off
clear
echo ""

BICyan='\033[1;96m'       # IBCyan
BCyan='\033[1;36m'        # Bold Cyan
Cyan='\033[0;36m'         # Cyan
NC='\033[0m'              # Text Reset
Yellow='\033[0;33m'       # Yellow
IPurple='\033[0;95m'      # Purple

echo "$IPurple
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠃⠀⠀⠀⠀⠀⠀⠰⣶⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⣴⠇⠀⠀⠀⠀⠸⣦⠈⢿⡄⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⢸⡏⢰⡇⠀⠀⢸⡆⢸⡆⢸⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠘⣧⡈⠃⢰⡆⠘⢁⣼⠁⣸⡇⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣄⠘⠃⠀⢸⡇⠀⠘⠁⣰⡟⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠃⠀⠀⢸⡇⠀⠀⠘⠋⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀
⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⢸⣿⣟⠉⢻⡟⠉⢻⡟⠉⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⢸⣿⣿⣷⣿⣿⣶⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⠈⠉⠉⢉⣉⣉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣉⣉⡉⠉⠉⠁⠀
⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉
Truitekifile - ver 1.6"


echo "$NC "
echo "Wait a bit buddy, connecting you ..."
echo
sudo nmcli dev wifi list
echo
echo "Select and copy a BSSID in the list "
echo 
echo "I  ve used my hacking doxxing skills to get all the wifi available around you !"
echo 
echo "Wich one do you want boss ?"
echo ""
echo "$BICyan [$Yellow*$BICyan] BSSID (wpa type security): $NC"
read -p " > " BSSID
sudo nmcli dev wifi connect $BSSID >/dev/null
sleep 2s
ping -c 1 8.8.8.8 >/dev/null


ping=$?


if [ $ping = 2 ]; then

	echo
	echo "hmmm look like it is secured, do you have the password ?"
	echo
	echo "$BICyan [$Yellow*$BICyan] Password: $NC"
	read -p " > " PWD
	if [ $PWD = no ]; then
		echo
		echo "Okay, i got stuff to do"
		exit
	else
		
		echo 
		sudo nmcli dev wifi connect $BSSID password $PWD >/dev/null
		verif=$?


		if [ $verif = 0 ]; then

			echo
			echo "Good job boss i just connected you"
			echo

		else

			echo 
			echo "hmmm boss look like it s not that can you tell me the password again ?"
			echo
			echo "$BICyan [$Yellow*$BICyan] Password: $NC"
			read -p " > " PWD2
			sudo nmcli dev wifi connect $BSSID password $PWD2 >/dev/null
			verif2=$?

			if [ $verif2 = 0 ]; then
				echo
				echo "Good job boss i just connected you"
				echo

			else 
				echo
				echo "Do you really know the password or are you just trying to guess it ?"
				echo
				echo "$BICyan [$Yellow*$BICyan] Password: $NC"
				read -p " > " PWD3
				sudo nmcli dev wifi connect $BSSID password $PWD3 >/dev/null
				verif3=$?
				

				if [ $verif3 = 0 ]; then
					echo 
					echo "Alright! You re conneceted !"
					echo

				else
					echo
					echo "Is it a joke ? Are you braindead or something ?
					echo I m out! Don t touch a computer ever again !"
					echo

				fi
			fi
		fi

	fi
	if [ $ping = 1 ]; then
		echo
		echo "Error: can't connect to 8.8.8.8, your internet may be busy or the server is down"
	fi

	if [ $ping = 0 ]; then
		echo
		echo "Good job boss i just connected you"

	else

		echo 
		echo "This error is not programed lol"


	fi
fi