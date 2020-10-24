CWD := $(shell pwd)
SOURCES := source/wren.dpp

.DEFAULT_GOAL := all
all: source/wren.d

source/wren.d: $(SOURCES)
	@dub fetch dpp --cache=local
	dub run dpp --cache=local -- --preprocess-only --include-path "$(PWD)/source" $(SOURCES)
