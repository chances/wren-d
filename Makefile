CWD := $(shell pwd)

.DEFAULT_GOAL := all
all: wren/lib/libwren.a

wren:
	git submodule update --init --recursive
wren/lib/libwren.a: wren wren/src/include/wren.h
	make -C wren/projects/make wren

clean:
	rm -f bin/wren-d-test-library
	rm -f -- *.lst
.PHONY: clean
