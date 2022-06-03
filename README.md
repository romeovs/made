# 🔨 made

This is a collection of `make` helpers for my personal projects.

## Installation

Install `made` as a git subrepository.

```sh
git submodule add https://github.com/romeovs/made .made
```

Include `made` in your `Makefile`:

```make
-include .made/made.make
```

And you're done!

If you want to set up `made` in a different folder than `.made` set the name of
the folder in your `Makefile` with the variable `made_root`, eg:

```make
made_root = ./foo
```
