registry ?= ghcr.io
owner ?= romeovs
name ?= TODO

-include log.make
-include git.make
-include image.make
-include kubernetes.make

-include node.make
-include format.make
