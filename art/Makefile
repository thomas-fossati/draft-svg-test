.DEFAULT_GOAL := svg

# TODO(tho) check goat

%.svg: %.ascii-art ; goat $< > $@

PIC_FILES := $(wildcard *.ascii-art)
SVG_FILES := $(PIC_FILES:.ascii-art=.svg)

svg: $(SVG_FILES)
	open -a /Applications/Firefox.app $(SVG_FILES)

clean: ; $(RM) $(SVG_FILES)
