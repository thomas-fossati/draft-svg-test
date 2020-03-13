# check if goat and svgcheck are installed
goat ?= $(shell command -v goat)
ifeq ($(strip $(goat)),)
$(error goat (ascii art to svg converter) not found. To install goat: 'go get github.com/blampe/goat')
endif

svgcheck ?= $(shell command -v svgcheck)
ifeq ($(strip $(svgcheck)),)
$(error svgcheck not found. To install svgcheck: 'pip install svgcheck')
endif

draft := draft-fossati-svg-test

$(draft).xml: $(draft).md
	kdrfc -3h $< 2>/dev/null
	xml2rfc --preptool --v3 $@
	mv $(draft).prepped.xml $@

CLEANFILES := $(draft).txt
CLEANFILES += $(draft).html
CLEANFILES += $(draft).xml
CLEANFILES += $(draft).prepped.xml
CLEANFILES += metadata.min.js

clean: ; $(RM) $(CLEANFILES)
.PHONY: clean
