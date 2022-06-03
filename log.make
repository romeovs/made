blue = $$(tput setaf 4)
normal = $$(tput sgr0)

msg = printf "$(blue)$(name)$(normal) %s\n"
print = printf "$(blue)$(name)$(normal) %s"
clear = printf "\r"
cprint = $(clear) ; $(print)
