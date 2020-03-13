---
title: SVG Tests
abbrev: SVG Tests
docname: draft-fossati-svg-test-02
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

## Tools

Install goat and svgcheck (Go and Python are obvious prerequisites):

~~~ bash
$ go get github.com/blampe/goat
$ pip install svgcheck
~~~

Install kramdown-rfc2629 (at least 1.3.2):

~~~ bash
# gem install kramdown-rfc2629 -v '>= 1.3.2'
~~~

# Draw

Two options:

* Either inline your ASCII / UTF-8 art:

~~~
    ~~~ goat
     .-.
    |o o|
   C| | |D
    | - |
    '___'
    ~~~
~~~

* Or source it from an external file:

~~~
    ~~~ goat
    {::include my-diagram.txt}
    ~~~
    {: #dia-1 title="My Diagram"}
~~~

# Build

To go from markdown to XML, HTML and TXT:

~~~ bash
$ kdrfc -3h draft-fossati-svg-test.md
~~~

Before submitting to the datatracker the XML file needs to be "prepped":

~~~ bash
$ xml2rfc --preptool --v3 draft-fossati-svg-test.xml
~~~

The "prepped" file, draft-fossati-svg-test.prepped.xml in this case, is what
needs to be uploaded to the datatracker.

# Examples

## Hello World

~~~ goat
                   / /
                 (\/_//`)
   .---.         /   '/
  |     |       0  0   \
  | Yo! |      /        \
  |     |     /    __/   \
   '----.    /,  _/ \     \
         \_. `-./ )  |     \
                 (   |      \
~~~

## An Inlined Sequence Diagram



~~~ goat
 .------.            .---------------.            .------.
|  NDC   |          |       IdO       |          |   CA   |
+--------+          +--------+--------+          +--------+
| Client |          | Server | Client |          | Server |
'---+----'          '----+---+---+----'          '----+---'
    |                    |       |                    |
    |   Order            |       |                    |
    |   Signature        |       |                    |
    o------------------->|       |                    |
    |                    |       |                    |
    |   [ No identity ]  |       |                    |
    |   [ validation  ]  |       |                    |
    |                    |       |                    |
    |   CSR              |       |                    |
    |   Signature        |       |                    |
    o------------------->|       |                    |
    |   Acknowledgement  |       |   Order'           |
    |<-------------------o       |   Signature        |
    |                    |       o------------------->|
    |                    |       |         Required   |
    |                    |       |   Authorizations   |
    |                    |       |<-------------------o
    |                    |       |   Responses        |
    |                    |       |   Signature        |
    |                    |       o------------------->|
    |                    |       |                    |
    |                    |       |<~~~~Validation~~~~>|
    |                    |       |                    |
    |                    |       |   CSR              |
    |                    |       |   Signature        |
    |                    |       o------------------->|
    |                    |       |   Acknowledgement  |
    |                    |       |<-------------------o
    |                    |       |                    |
    |<~~Await issuance~->|       |<~~Await issuance~~>|
    |                                                 |
    |     (unauthenticated) GET STAR certificate      |
    o------------------------------------------------>|
    |                 Certificate #1                  |
    |<------------------------------------------------o
    |     (unauthenticated) GET STAR certificate      |
    o------------------------------------------------>|
    |                 Certificate #2                  |
    |<------------------------------------------------o
    |                     [...]                       |
    |     (unauthenticated) GET STAR certificate      |
    o------------------------------------------------>|
    |                 Certificate #n                  |
    |<------------------------------------------------o
~~~

## A Sourced Box and Arrows Diagram

~~~ goat
{::include art/stir-delegation.ascii-art}
~~~
{: #example2 title="STIR Delegation Flow"}

# IANA Considerations

No requests are made to IANA.

# Security Considerations

There are none.

# Acknowledgments

Yaron for pointing out the current limitations in the tooling and providing the
workaround.  Carsten for working the kramdown magic.

--- back
