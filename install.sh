#!/bin/bash

logo_for_install_step() {
  tsize=$(tput cols)
  clear
  echo ""
  printf "\033[38;5;154m  ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57))); echo ""
  printf "\033[38;5;155m  ☆☆☆☆☆☆▄█☆☆☆☆▄████████☆☆☆▄▄▄▄███▄▄▄▄☆☆☆☆☆☆☆▄████████☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;156m  ☆☆☆☆☆☆███☆☆☆███☆☆☆☆███☆▄███☆█████☆███▄☆☆☆███☆☆☆☆███☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;157m  ☆☆☆☆☆☆███☆☆☆███☆☆☆☆███☆███☆☆☆███☆☆☆███☆☆☆███☆☆☆☆█▀☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;158m  ☆☆☆☆☆☆███☆☆☆███☆☆☆☆███☆███☆☆☆███☆☆☆███☆☆▄███▄▄▄☆☆☆☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;159m  ☆☆☆☆☆☆███☆▀███████████☆███☆☆☆███☆☆☆███☆▀▀███▀▀▀☆☆☆☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;158m  ☆☆☆☆☆☆███☆☆☆███☆☆☆☆███☆███☆☆☆███☆☆☆███☆☆☆███☆☆☆☆█▄☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;157m  ☆☆☆☆☆☆███☆☆☆███☆☆☆☆███☆███☆☆☆███☆☆☆███☆☆☆███☆☆☆☆███☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;156m  ☆☆█▄☆▄███☆☆☆███☆☆☆☆█▀☆☆☆▀█☆☆☆███☆☆☆█▀☆☆☆☆██████████☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;155m  ☆☆▀▀▀▀▀▀☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;154m  ☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"
  printf "☆%.0s" $(seq $((tsize-57)))
  echo ""
  printf "\033[38;5;196m━\033[00m%.0s" $(seq $tsize)
  echo ""
}

installer() {
  pkg=$1
  type -p "$pkg" &>/dev/null || {
    echo -e "\n\e[1;36m[\e[1;32m+\e[1;36m]\e[1;33m Installing package : $pkg\e[1;33m\n"
      if [[ $(command -v pkg) ]]; then
	    pkg install "$pkg" -y
      elif [[ $(command -v apt) ]]; then
        sudo apt install "$pkg" -y
      elif [[ $(command -v apt-get) ]]; then
        sudo apt-get install "$pkg" -y
      elif [[ $(command -v pacman) ]]; then
        sudo pacman -S "$pkg" --noconfirm
      elif [[ $(command -v dnf) ]]; then
        sudo dnf -y install "$pkg"
      elif [[ $(command -v yum) ]]; then
        sudo yum -y install "$pkg"
      else
        echo -e "\n\e[1;31m[!] Unsupported package manager, Install packages manually.\e[00m\n"
        exit 1
      fi
  }
}

installer2() {
  pkg="ncurses-utils"
  type -p "tput" &>/dev/null || {
    echo -e "\n\e[1;36m[\e[1;32m+\e[1;36m]\e[1;33m Installing package : ncurses-utils\e[1;33m\n"
      if [[ $(command -v pkg) ]]; then
	    pkg install "$pkg" -y
      elif [[ $(command -v apt) ]]; then
        sudo apt install "$pkg" -y
      elif [[ $(command -v apt-get) ]]; then
        sudo apt-get install "$pkg" -y
      elif [[ $(command -v pacman) ]]; then
        sudo pacman -S "$pkg" --noconfirm
      elif [[ $(command -v dnf) ]]; then
        sudo dnf -y install "$pkg"
      elif [[ $(command -v yum) ]]; then
        sudo yum -y install "$pkg"
      else
        echo -e "\n\e[1;31m[!] Unsupported package manager, Install packages manually.\e[00m\n"
        exit 1
      fi
  }
}

installer2
logo_for_install_step
installer "python3"
installer "which"
installer "php"
python3 main.py