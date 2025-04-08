#!/bin/bash

cat << "EOF"
 ██░ ██  ▒█████   ███▄    █  ██ ▄█▀▓█████  ██▀███      ▄████▄   ██▓     ▒█████   ▄▄▄       ██ ▄█▀    ▄████▄  ▄▄▄█████▓ ██▓    
▓██░ ██▒▒██▒  ██▒ ██ ▀█   █  ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒   ▒██▀ ▀█  ▓██▒    ▒██▒  ██▒▒████▄     ██▄█▒    ▒██▀ ▀█  ▓  ██▒ ▓▒▓██▒    
▒██▀▀██░▒██░  ██▒▓██  ▀█ ██▒▓███▄░ ▒███   ▓██ ░▄█ ▒   ▒▓█    ▄ ▒██░    ▒██░  ██▒▒██  ▀█▄  ▓███▄░    ▒▓█    ▄ ▒ ▓██░ ▒░▒██░    
░▓█ ░██ ▒██   ██░▓██▒  ▐▌██▒▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄     ▒▓▓▄ ▄██▒▒██░    ▒██   ██░░██▄▄▄▄██ ▓██ █▄    ▒▓▓▄ ▄██▒░ ▓██▓ ░ ▒██░    
░▓█▒░██▓░ ████▓▒░▒██░   ▓██░▒██▒ █▄░▒████▒░██▓ ▒██▒   ▒ ▓███▀ ░░██████▒░ ████▓▒░ ▓█   ▓██▒▒██▒ █▄   ▒ ▓███▀ ░  ▒██▒ ░ ░██████▒
 ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒░   ▒ ▒ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░   ░ ░▒ ▒  ░░ ▒░▓  ░░ ▒░▒░▒░  ▒▒   ▓▒█░▒ ▒▒ ▓▒   ░ ░▒ ▒  ░  ▒ ░░   ░ ▒░▓  ░
 ▒ ░▒░ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░     ░  ▒   ░ ░ ▒  ░  ░ ▒ ▒░   ▒   ▒▒ ░░ ░▒ ▒░     ░  ▒       ░    ░ ░ ▒  ░
 ░  ░░ ░░ ░ ░ ▒     ░   ░ ░ ░ ░░ ░    ░     ░░   ░    ░          ░ ░   ░ ░ ░ ▒    ░   ▒   ░ ░░ ░    ░          ░        ░ ░   
 ░  ░  ░    ░ ░           ░ ░  ░      ░  ░   ░        ░ ░          ░  ░    ░ ░        ░  ░░  ░      ░ ░                   ░  ░
                                                      ░                                             ░                          
EOF

while true; do
    echo ""
    echo "by CL0WNSEC"
    echo "┌───────────────────────────────┐"
    echo "│      Honker Cloak Control     │"
    echo "└───────────────────────────────┘"
    echo ""
    echo "LET'S CLOWN THAT FIREWALL ;)"
    echo ""
    echo "0)  LEAVE          – Exit Cloak Control Script"
    echo "H)  HELP           – Setup Instructions & Requirements"
    echo "1)  TOR-B1         – Start Tor with obfs4 bridge"
    echo "2)  TOR-B2         – Start Tor with Snowflake bridge"
    echo "3)  TOR-OFF        – Turn OFF Tor"
    echo "4)  VPN-ON         – Launch ProtonVPN GUI"
    echo "5)  VPN-OFF        – Close ProtonVPN GUI"
    echo "6)  VPN-STAT       – Check ProtonVPN Status"
    echo "7)  D33PKLOWNKLOAK – Start VPN + TOR + RMAC"
    echo "8)  SEE            – Check IP and VPN/Tor Status"
    echo "9)  MAC-WIZ        – View & Change MAC Address"
    echo "10) SITR3P         – Show Cloak Status Report"
    echo "11) VERIFY         – Ping Google DNS to Check Connectivity"
    echo "12) INSTALL        – Install Requirements For This Tool"
    echo ""
    echo "(Press Ctrl+Z to stop script manually if needed)"
    echo ""
read -p "Selection: " choice

    # Functions
    check_ip_status() {
        echo "[*] Checking public IP address..."
        ip=$(curl -s https://ifconfig.me)
        echo "IP Address: $ip"
        echo ""

        if ip a | grep -qE 'proton|tun0|wg0' || ps aux | grep -q '[o]penvpn'; then
            echo "[+] VPN: Likely Active"
        else
            echo "[-] VPN: Not Detected"
        fi

        if ps aux | grep -q '[t]or'; then
            echo "[+] Tor: Tor process running — Possibly Active"
        else
            echo "[-] Tor: Not Detected"
        fi

        if grep -q '^Bridge obfs4' /etc/tor/torrc; then
            echo "[+] Tor Bridge: obfs4"
        elif grep -q '^Bridge snowflake' /etc/tor/torrc; then
            echo "[+] Tor Bridge: snowflake"
        else
            echo "[-] Tor Bridge: Unknown or not set"
        fi
    }

install_requirements_menu() {
    while true; do
        echo ""
        echo "┌──────────────────────────────────────────┐"
        echo "│     Honker Cloak Control – INSTALL       │"
        echo "└──────────────────────────────────────────┘"
        echo ""
        echo "1) Install All Required Packages"
        echo "2) Back to Main Menu"
        echo "3) Check Installed Packages and Show Help"
        echo ""
        read -p "Select an option: " install_choice

        case "$install_choice" in
            1)
                echo ""
                echo "[+] Updating package lists..."
                sudo apt update

                echo ""
                echo "[+] Installing core dependencies..."
                sudo apt install -y tor python3 curl macchanger net-tools jq xterm

                echo ""
                echo "Which ProtonVPN components do you want to install?"
                echo "  [1] ProtonVPN CLI only"
                echo "  [2] ProtonVPN GUI only"
                echo "  [3] Both CLI and GUI"
                read -p "Your choice: " vpnchoice

                case $vpnchoice in
                    1)
                        echo "[+] Installing ProtonVPN CLI..."
                        sudo apt install -y protonvpn-cli
                        ;;
                    2)
                        echo "[+] Installing ProtonVPN GUI..."
                        sudo apt install -y protonvpn
                        ;;
                    3)
                        echo "[+] Installing both CLI and GUI..."
                        sudo apt install -y protonvpn protonvpn-cli
                        ;;
                    *)
                        echo "[-] Invalid input. Skipping ProtonVPN installation."
                        ;;
                esac
                echo ""
                echo "[✓] Installation process complete."
                read -p "Press Enter to return to Install Menu..."
                ;;
            2)
                break
                ;;
            3)
                check_installed_packages
                ;;
            *)
                echo "[-] Invalid selection. Try again."
                ;;
        esac
    done
}

check_installed_packages() {
    echo ""
    echo "[*] Checking required packages..."

    missing=()
    for pkg in tor python3 curl macchanger net-tools jq xterm; do
        if ! dpkg -s $pkg &>/dev/null; then
            echo "[-] $pkg is NOT installed."
            missing+=("$pkg")
        else
            echo "[✓] $pkg is installed."
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        echo ""
        echo "[!] Missing packages detected:"
        for m in "${missing[@]}"; do
            echo "    - $m"
        done
        echo ""
        echo "You can try to manually install them:"
        echo "    sudo apt install ${missing[*]}"
    else
        echo ""
        echo "[✓] All required packages appear to be installed."
    fi

    echo ""
    read -p "Press Enter to return to Install Menu..."
}


    mac_menu() {
        echo "[*] Current MAC addresses:"
        ip link | grep -E '^[0-9]+: ' | cut -d: -f2 | while read iface; do
            iface=$(echo $iface | xargs)
            if [[ "$iface" != "lo" ]]; then
                mac=$(cat /sys/class/net/$iface/address)
                echo "  $iface : $mac"
            fi
        done

        echo ""
        read -p "[?] Enter interface to randomize MAC (e.g., eth0, wlan0): " iface
        if [[ -n "$iface" ]]; then
            echo "[*] Changing MAC for $iface..."
            sudo ip link set "$iface" down
            sudo macchanger -r "$iface"
            sudo ip link set "$iface" up
            echo "[+] MAC address randomized."
        else
            echo "[-] No interface provided."
        fi
    }

    # Handle menu choices
    case "$choice" in
        0)
            echo "HAVE FUN..."
            break
            ;;
        1|2)
            PROFILE=$([ "$choice" == "1" ] && echo "obfs4" || echo "snowflake")
            ;;
        3)
            echo "Stopping Tor service..."
            sudo systemctl stop tor
            echo "Tor is now OFF."
            ;;
        4)
            echo "Launching ProtonVPN GUI..."
            nohup protonvpn-app >/dev/null 2>&1 &
            echo "ProtonVPN GUI started."
            ;;
        5)
            echo "Closing ProtonVPN GUI..."
            pkill protonvpn-app
            echo "ProtonVPN GUI closed."
            ;;
        6)
            echo "Checking ProtonVPN status..."
            protonvpn-cli status || echo "GUI version running; status check not available via CLI."
            ;;
        7)
            echo "Initiating D33PKLOWNKLOAK protocol..."
            echo "[*] Randomizing MAC address before cloaking..."
            iface=$(ip route | grep default | awk '{print $5}')
            sudo ip link set "$iface" down
            sudo macchanger -r "$iface"
            sudo ip link set "$iface" up
            echo "[+] MAC address for $iface randomized."
            echo "Launching ProtonVPN GUI..."
            nohup protonvpn-app >/dev/null 2>&1 &
            sleep 2
            PROFILE="obfs4"
            ;;
        8)
            check_ip_status
            ;;
        9)
            mac_menu
            ;;
        10)
            echo "[*] SITR3P – Cloak Status Report"
            iface=$(ip route | grep default | awk '{print $5}')
            echo "[*] Interface: $iface"
            echo "[*] MAC Address: $(cat /sys/class/net/$iface/address)"
            echo "[*] IP Address (external): $(curl -s https://ifconfig.me)"
            echo "[*] IP Address (local): $(ip -o -4 addr show $iface | awk '{print $4}' | cut -d/ -f1)"
            if grep -q '^Bridge obfs4' /etc/tor/torrc; then
                echo "[*] Bridge Type: obfs4"
            elif grep -q '^Bridge snowflake' /etc/tor/torrc; then
                echo "[*] Bridge Type: snowflake"
            else
                echo "[*] Bridge Type: Unknown"
            fi
            if ps aux | grep -q '[t]or'; then
                echo "[*] Tor: Active"
            else
                echo "[*] Tor: Inactive"
            fi
            if ip a | grep -qE 'proton|tun0|wg0' || ps aux | grep -q '[o]penvpn'; then
                echo "[*] VPN: Active"
            else
                echo "[*] VPN: Inactive"
            fi
            ;;
        11)
            echo "[*] VERIFY – Checking connectivity to 8.8.8.8 (Google DNS)..."
            ping_output=$(ping -c 5 8.8.8.8)
            echo "$ping_output"
            if echo "$ping_output" | grep -q "0 received"; then
                echo "[-] No packets received. No internet connection."
            else
                echo "[+] Ping successful. Network is connected."
                if echo "$ping_output" | grep -q "DUP!"; then
                    echo "[!] Warning: Duplicate packets (DUP!) detected."
                fi
            fi
            ;;

         12)
    install_requirements_menu
    ;;




        H|h)
            echo "[*] HELP – Cloak Control Setup Guide"
            echo ""
            echo "To use this script fully, make sure the following components are installed and configured:"
            echo ""
            echo "[+] ProtonVPN Setup:"
            echo "    sudo apt install -y openvpn dialog python3-pip"
            echo "    pip3 install protonvpn-cli"
            echo "    sudo protonvpn init"
            echo "    OR install ProtonVPN GUI via .deb package from official website"
            echo ""
            echo "[+] Tor Setup:"
            echo "    sudo apt install tor"
            echo ""
            echo "[+] Create Tor Bridge Profiles:"
            echo "    mkdir -p ~/tor_profiles"
            echo "    nano ~/tor_profiles/obfs4.torrc"
            echo "        (Paste your obfs4 bridge info from https://bridges.torproject.org)"
            echo "    nano ~/tor_profiles/snowflake.torrc"
            echo "        (Add: UseBridges 1 and ClientTransportPlugin snowflake ... etc.)"
            echo ""
            echo "[+] Other Tools Required:"
            echo "    sudo apt install macchanger curl"
            echo ""
            echo "Once everything is installed, run the script and it will detect your setup."
            ;;
        *)
            echo "Invalid choice. Try again."
            ;;
    esac

    # Apply selected Tor profile if needed
    if [[ "$choice" == "1" || "$choice" == "2" || "$choice" == "7" ]]; then
        PROFILE_PATH="/home/$USER/tor_profiles/${PROFILE}.torrc"

        if [ -f "$PROFILE_PATH" ]; then
            echo ""
            echo "Switching to $PROFILE profile..."
            sudo cp "$PROFILE_PATH" /etc/tor/torrc
            sudo systemctl restart tor
            echo "Tor started with '$PROFILE' bridge."
        else
            echo "Tor profile '$PROFILE' not found at $PROFILE_PATH."
        fi
    fi

done
