SHELL := /bin/bash
current_path := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: run

build: install-toolchain
	crystal build_all.cr

run: build
	crystal run_all.cr

test: build
	crystal test_all.cr

install-toolchain:
	command -v crystal || (command -v apt-get && curl https://dist.crystal-lang.org/apt/setup.sh | sudo bash && apt-get install build-essential crystal)
	command -v crystal || (command -v brew && brew install crystal)

clean: install-toolchain
	crystal delete_build_artifacts.cr
