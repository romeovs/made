made_ci_shell ?= /usr/bin/bash

ifdef CI
SHELL = $(made_ci_shell)
endif
