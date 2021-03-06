# only enable colors when supported
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
	# Color Constants
	COLOR_NORMAL="\033[0m"
	COLOR_BOLD="\033[1m"
	COLOR_UNDERLINE="\033[4m"
	COLOR_BLACK="\033[0;30m"
	COLOR_RED="\033[0;31m"
	COLOR_GREEN="\033[0;32m"
	COLOR_BROWN="\033[0;33m"
	COLOR_BLUE="\033[0;34m"
	COLOR_MAGENTA="\033[0;35m"
	COLOR_CYAN="\033[0;36m"
	COLOR_LIGHT_GREY="\033[0;37m"
	COLOR_DARK_GREY="\033[1;37m"
	COLOR_DARK_RED="\033[1;31m"
	COLOR_DARK_GREEN="\033[1;32m"
	COLOR_YELLOW="\033[1;33m"
	COLOR_DARK_BLUE="\033[1;34m"
	COLOR_DARK_MAGENTA="\033[1;35m"
	COLOR_DARK_CYAN="\033[1;36m"
	COLOR_WHITE="\033[1;37m"
else
	COLOR_NORMAL=""
	COLOR_BOLD=""
	COLOR_UNDERLINE=""
	COLOR_BLACK=""
	COLOR_RED=""
	COLOR_GREEN=""
	COLOR_BROWN=""
	COLOR_BLUE=""
	COLOR_MAGENTA=""
	COLOR_CYAN=""
	COLOR_LIGHT_GREY=""
	COLOR_DARK_GREY=""
	COLOR_DARK_RED=""
	COLOR_DARK_GREEN=""
	COLOR_YELLOW=""
	COLOR_DARK_BLUE=""
	COLOR_DARK_MAGENTA=""
	COLOR_DARK_CYAN=""
	COLOR_WHITE=""
fi

__dots_print_colors() {
	echo -e ${COLOR_NORMAL}COLOR_NORMAL${COLOR_NORMAL}
	echo -e ${COLOR_BOLD}COLOR_BOLD${COLOR_NORMAL}
	echo -e ${COLOR_UNDERLINE}COLOR_UNDERLINE${COLOR_NORMAL}
	echo -e ${COLOR_BLACK}COLOR_BLACK${COLOR_NORMAL}
	echo -e ${COLOR_RED}COLOR_RED${COLOR_NORMAL}
	echo -e ${COLOR_GREEN}COLOR_GREEN${COLOR_NORMAL}
	echo -e ${COLOR_BROWN}COLOR_BROWN${COLOR_NORMAL}
	echo -e ${COLOR_BLUE}COLOR_BLUE${COLOR_NORMAL}
	echo -e ${COLOR_MAGENTA}COLOR_MAGENTA${COLOR_NORMAL}
	echo -e ${COLOR_CYAN}COLOR_CYAN${COLOR_NORMAL}
	echo -e ${COLOR_LIGHT_GREY}COLOR_LIGHT_GREY${COLOR_NORMAL}
	echo -e ${COLOR_DARK_GREY}COLOR_DARK_GREY${COLOR_NORMAL}
	echo -e ${COLOR_DARK_RED}COLOR_DARK_RED${COLOR_NORMAL}
	echo -e ${COLOR_DARK_GREEN}COLOR_DARK_GREEN${COLOR_NORMAL}
	echo -e ${COLOR_YELLOW}COLOR_YELLOW${COLOR_NORMAL}
	echo -e ${COLOR_DARK_BLUE}COLOR_DARK_BLUE${COLOR_NORMAL}
	echo -e ${COLOR_DARK_MAGENTA}COLOR_DARK_MAGENTA${COLOR_NORMAL}
	echo -e ${COLOR_DARK_CYAN}COLOR_DARK_CYAN${COLOR_NORMAL}
	echo -e ${COLOR_WHITE}COLOR_WHITE${COLOR_NORMAL}
}
