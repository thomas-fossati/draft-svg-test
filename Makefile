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

all: $(draft).md ; kdrfc -3h $<

clean: ; $(RM) $(draft).txt $(draft).html $(draft).xml metadata.min.js
