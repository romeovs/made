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

countdown = function __fn { if [ "$$CI" != "" ]; then exit 0; fi; for i in $$(seq $$1 -1 1); do printf $(_clr)"$(_blue)$(name)$(_normal)$(_sep) $$2" $$i; sleep 1; done; $(clear); }; __fn
