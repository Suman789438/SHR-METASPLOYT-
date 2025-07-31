#!/bin/bash

echo "🔧 Starting MH Zone Environment Setup..."

# Ask for storage permission
termux-setup-storage

# Update & upgrade packages
echo "📦 Updating Termux..."
pkg update -y && pkg upgrade -y

# Install required packages
for pkg in curl git python wget qrencode; do
    if ! command -v $pkg > /dev/null; then
        echo "📥 Installing $pkg..."
        pkg install $pkg -y
    fi
done

# Add x11-repo if not exists
if [ ! -d "$PREFIX/var/lib/pkg/x11-repo" ]; then
    echo "➕ Adding x11-repo..."
    pkg install x11-repo -y
fi

# Add unstable-repo if not exists
if [ ! -d "$PREFIX/var/lib/pkg/unstable-repo" ]; then
    echo "➕ Adding unstable-repo..."
    pkg install unstable-repo -y
fi

# Install metasploit with fallback
if ! command -v msfconsole > /dev/null; then
    echo "📥 Installing Metasploit (first try)..."
    pkg install metasploit -y
    if ! command -v msfconsole > /dev/null; then
        echo "⚠️ Default install failed, trying alternative method..."
        wget https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/metasploit.sh -O metasploit.sh
        chmod +x metasploit.sh
        ./metasploit.sh
    fi
fi

# Final Confirmation
clear
echo ""
echo -e "\033[0;32m✅ ALL PACKAGES SUCCESSFULLY INSTALLED!"
echo -e "📦 Installed: metasploit, msfvenom, qrencode, curl, git, wget, python, x11-repo, unstable-repo"
echo -e "📁 Storage Permission Granted"
echo -e "💀 You're Ready to Launch HCO METASPLOYT Now!\033[0m"

# Opening YouTube Channel Prompt
clear
echo -e "\033[1;33m🔔 Opening YouTube Channel...\033[0m"
echo -e "\033[1;32m📺 Please Subscribe Our Channel First!\033[0m"
echo -e "\033[1;33m🔥🔥The tool will work after subscribing.✅✅\033[0m"
sleep 3
termux-open-url "https://youtube.com/@hackers_colony_tech?si=B7pbtwLrlM8YbOzI"
echo -e "\033[1;36m⏳ Waiting for you to return after subscribing...\033[0m"
sleep 10

# Launch metasployt.sh
if [ -f hco-metasployt.sh ]; then
    echo -e "\n\036[1;32m✅ Launching metasployt.sh...\036[0m"
    chmod +x hco-metasployt.sh
    bash hco-metasployt.sh
else
    echo -e "\n\033[1;31m❌ metasployt.sh file not found!\033[0m"
fi
