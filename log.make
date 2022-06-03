_clr = "\\n"
_sep = ":"
ifndef CI
_blue = $$(tput setaf 4)
_normal = $$(tput sgr0)
_clr = "\\r\\33[2K"
_sep = ""
endif 

msg = printf "$(_blue)$(name)$(_normal)$(_sep) %s\\n"
print = printf "$(_blue)$(name)$(_normal)$(_sep) %s"
clear = printf "$(_clr)"
end = printf "\n"
cprint = $(clear) ; $(print)
