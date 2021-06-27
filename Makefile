CWD := $(shell pwd)
SOURCES := source/wren/api.d source/wren/bindings.d

.DEFAULT_GOAL := all
all: source/wren/bindings.d

source/wren/bindings.d: source/wren.h source/wren.dpp
	@dub fetch dpp --cache=local
	dub run dpp --cache=local -- --preprocess-only --include-path "$(CWD)/source" source/wren.dpp
	@(echo "// AUTOMATICALLY GENERATED: DO NOT EDIT\nmodule wren.bindings;"; cat source/wren.d) > source/wren/bindings.d
	@rm source/wren.d

clean:
	rm -f bin/wren-d-test-library
	rm -f -- *.lst
.PHONY: clean
