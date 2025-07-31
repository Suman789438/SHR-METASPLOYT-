#!/bin/bash

echo "🔧 Starting MH Zone Environment Setup..."

# Ask for storage permission
termux-setup-storage

# Update & upgrade packages
echo "📦 Updating Termux..."
pkg update -y && pkg upgrade -y

# Install curl
if ! command -v curl > /dev/null; then
    echo "📥 Installing curl..."
    pkg install curl -y
fi

# Install git
if ! command -v git > /dev/null; then
    echo "📥 Installing git..."
    pkg install git -y
fi

# Install python
if ! command -v python > /dev/null; then
    echo "📥 Installing python..."
    pkg install python -y
fi

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

# Install qrencode
if ! command -v qrencode > /dev/null; then
    echo "📥 Installing qrencode..."
    pkg install qrencode -y
fi

# Install metasploit
if ! command -v msfconsole > /dev/null; then
    echo "📥 Installing Metasploit (will take time)..."
    pkg install metasploit -y
fi

# Final Confirmation
clear
echo ""
echo -e "\033[0;32m ALL PACKEGE SUCCESSFULLY INSTALLED ✅ !"
echo -e "📦 INSTALLED PACKEGE NEME : metasploit, qrencode, curl, git, Figlet, X11-repo, unstable-repo, python"
echo -e "📁 Storage Permission Granted"
echo -e "💀 You're Ready to Launch HCO METASPLOYT Now!\033[0m"

#lunch HCO METASPLOYT tool 
#!/bin/bash

clear
echo -e "\033[1;33m🔔 Opening YouTube Channel...\033[0m"
echo -e "\033[1;32m📺 Please Subscribe Our Channel First!\033[0m"
sleep 3

# 👉 ইউটিউব চ্যানেল রিডাইরেক্ট (Termux browser or default browser)
termux-open-url "https://youtube.com/@hackers_colony_tech?si=B7pbtwLrlM8YbOzI"

# ইউজারকে চ্যানেল সাবস্ক্রাইব করার সময় দিতে চাইলে:
echo -e "\033[1;36m⏳ Waiting for you to return after subscribing...\033[0m"
sleep 10  # ইউজার চাইলে সাবস্ক্রাইব করে ফিরে আসবে

# metasployt.sh চালু করার আগে চেক
if [ -f metasployt.sh ]; then
    echo -e "\n\033[1;32m✅ Launching metasployt.sh...\033[0m"
    chmod +x metasployt.sh
    bash hco-metasployt.sh
else
    echo -e "\n\033[1;31m❌ metasployt.sh file not found!\033[0m"
fi