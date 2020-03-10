---
title: SVG Tests
abbrev: SVG Tests
docname: draft-fossati-svg-test-01
category: exp

ipr: trust200902
area: Security
workgroup: None
keyword: Internet-Draft

stand_alone: yes
pi:
  rfcedstyle: yes
  toc: yes
  tocindent: yes
  sortrefs: yes
  symrefs: yes
  strict: yes
  comments: yes
  inline: yes
  text-list-symbols: o-*+
  compact: yes
  subcompact: yes
  consensus: false

author:
 -
    ins: T. Fossati
    name: Thomas Fossati
    email: thomas.fossati@arm.com


--- abstract

This memo is for experimenting with SVG in the context of RFC production.

--- middle

# Introduction

This memo is for experimenting with SVG in the context of RFC production.

This document assumes a kramdown-rfc2629 based editing flow.

## Conventions used in this document

{::boilerplate bcp14}

# Code Layout

The code is structured as follows:

~~~
├── Makefile
├── art
│   ├── cdni-delegation.ascii-art
│   ├── cdni-dns-redirection.ascii-art
│   ├── e2e-flow.ascii-art
│   ├── stir-delegation.ascii-art
│   └── stir-delegation.svg
└── draft-fossati-svg-test.md
~~~

In particular, the art directory contains the diagrams in ASCII art.

# From ASCII art to SVG
{: #sec-from-ascii-to-svg}


The Makefile contains bunch of variables and a pattern rule to deal with
automatic generation of SVG from ASCII using a Golang tool called goat.
Another tool, svgcheck, is used to make sure xml2rfc will like the SVG.

~~~
# The "art" variables:

art_src := $(wildcard $(art_dir)/*.ascii-art)
art_svg := $(art_src:.ascii-art=.svg)


# The pattern rule used to transform each and every ASCII
# art into SVG:

%.svg: %.ascii-art
    @$(goat) $< | $(svgcheck) -r -o $@ 2>/dev/null || true
~~~

To install goat and svgcheck, do:

~~~ sh
$ go get github.com/blampe/goat
$ pip install svgcheck
~~~

# Building the XML

The Submit tool on the Datatracker wants the submitted XML to be self
contained.

To inline the diagrams you need to do the following:

~~~ sh
$ kramdown-rfc2629 --v3 \
    draft-fossati-svg-test.md > draft-fossati-svg-test.xml
$ xml2rfc --v3 --preptool draft-fossati-svg-test.xml
$ xml2rfc --v3 --expand draft-fossati-svg-test.prepped.xml
$ mv draft-fossati-svg-test.prepped.exp.xml \
    draft-fossati-svg-test.xml
$ rm -f draft-fossati-svg-test.prepped.xml
~~~

The "prepped" and "expanded" draft-fossati-svg-test.xml inlines both the ASCII
and the SVG in the artset and is ready for submission.

Of course, from there you can also do the usual TXT / HTML generation:

~~~ sh
$ xml2rfc --v3 draft-fossati-svg-test.xml \
    draft-fossati-svg-test.txt
$ xml2rfc --v3 --html draft-fossati-svg-test.xml \
    draft-fossati-svg-test.html
~~~

# Examples

## A Sequence Diagram

kramdown does not support artset natively.  So the artset must be inserted
using native xml2rfc syntax.  The SVG is included in artwork as a local file.
The SVG file is created from its ASCII art equivalent as explained in
{{sec-from-ascii-to-svg}}.

~~~xml
<t>
  <figure anchor="fig-endtoend"
          title="End to end STAR delegation flow">
    <artset>
      <artwork type="ascii-art" src="art/e2e-flow.ascii-art" />
      <artwork type="svg" src="art/e2e-flow.svg" />
    </artset>
  </figure>
</t>
~~~

The result is shown in {{fig-endtoend}}.

<t>
  <figure anchor="fig-endtoend"
          title="End to end STAR delegation flow">
    <artset>
      <artwork type="ascii-art" src="art/e2e-flow.ascii-art" />
      <artwork type="svg" src="art/e2e-flow.svg" />
    </artset>
  </figure>
</t>

## Lots of Boxes and Arrows

<t>
  <figure anchor="fig-cdni-dns-redirection"
          title="DNS Redirection">
    <artset>
      <artwork type="ascii-art" src="art/cdni-dns-redirection.ascii-art" />
      <artwork type="svg" src="art/cdni-dns-redirection.svg" />
    </artset>
  </figure>
</t>

## Even More Boxes and Numbered Arrows

<t>
  <figure anchor="fig-cdni-flow"
          title="Two levels delegation in CDNI">
    <artset>
      <artwork type="ascii-art" src="art/cdni-delegation.ascii-art" />
      <artwork type="svg" src="art/cdni-delegation.svg" />
    </artset>
  </figure>
</t>

## And Another One

<t>
  <figure anchor="fig-stir-flow"
          title="Delegation in STIR">
    <artset>
      <artwork type="ascii-art" src="art/stir-delegation.ascii-art" />
      <artwork type="svg" src="art/stir-delegation.svg" />
    </artset>
  </figure>
</t>


# IANA Considerations

No requests are made to IANA.

# Security Considerations

There are none.

# Acknowledgments

Yaron for pointing out the current limitations in the tooling and providing the
workaround.

--- back
