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

## Conventions used in this document

{::boilerplate bcp14}

# A Sequence Diagram

<t>
  <figure anchor="fig-endtoend" title="End to end STAR delegation flow">
    <artset>
      <artwork type="ascii-art" src="art/e2e-flow.ascii-art" />
      <artwork type="svg" src="art/e2e-flow.svg" />
    </artset>
  </figure>
</t>

# Lots of Boxes and Arrows

<t>
  <figure anchor="fig-cdni-dns-redirection" title="DNS Redirection">
    <artset>
      <artwork type="ascii-art" src="art/cdni-dns-redirection.ascii-art" />
      <artwork type="svg" src="art/cdni-dns-redirection.svg" />
    </artset>
  </figure>
</t>

# Even More Boxes and Arrows

<t>
  <figure anchor="fig-cdni-flow" title="Two levels delegation in CDNI">
    <artset>
      <artwork type="ascii-art" src="art/cdni-delegation.ascii-art" />
      <artwork type="svg" src="art/cdni-delegation.svg" />
    </artset>
  </figure>
</t>

# And Another One

<t>
  <figure anchor="fig-stir-flow" title="Delegation in STIR">
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
