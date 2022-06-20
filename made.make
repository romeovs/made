registry ?= ghcr.io
owner ?= romeovs
name ?= TODO

made_root ?= .made

-include $(made_root)/ci.make
-include $(made_root)/log.make
-include $(made_root)/git.make
-include $(made_root)/image.make
-include $(made_root)/kustomize.make

-include $(made_root)/node.make
-include $(made_root)/format.make
-include $(made_root)/util.make
-include $(made_root)/typecheck.make
