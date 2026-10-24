// Kaizen thoughts — fill the placeholders, keep the structure.
// Compile: typst compile thoughts.typ thoughts.pdf

#let title = "__TITLE__"
#let project = "__PROJECT__"
#let date = "__DATE__"

#set document(title: title)
#set page(
  paper: "a4",
  margin: (x: 2.4cm, y: 2.6cm),
  numbering: "1",
  footer: context [
    #set text(size: 8.5pt, fill: luma(110))
    #project — Kaizen thoughts #h(1fr) #counter(page).display()
  ],
)
#set text(size: 11pt, lang: "en")
#set par(justify: true, leading: 0.68em, spacing: 1.1em)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => block(above: 1.6em, below: 0.8em)[
  #set text(size: 14pt, weight: "semibold")
  #it
]
#show heading.where(level: 2): set text(size: 12pt, weight: "semibold")

#align(left)[
  #text(size: 9pt, fill: luma(110), tracking: 0.08em)[KAIZEN THOUGHTS]
  #v(0.2em)
  #text(size: 22pt, weight: "bold")[#title]
  #v(0.1em)
  #text(size: 11pt, fill: luma(80))[#project · #date]
]
#v(1em)
#line(length: 100%, stroke: 0.5pt + luma(180))

// A callout for the one-paragraph summary at the top.
#let summary(body) = block(
  fill: luma(245), inset: 12pt, radius: 3pt, width: 100%, body,
)

#summary[
  __SUMMARY__
]

= What this project is, as I read it

__SECTION_1__

= What it is trying to achieve

__SECTION_2__

= How Kaizen could work here

__SECTION_3__

= The first steps

// A short numbered list: the first three to five small steps, each with its owner.
__FIRST_STEPS__

#v(1.5em)
#text(size: 8.5pt, fill: luma(110))[
  The thoughts of an AI agent, from the contents of the project folder on #date.
  Statements marked _(inferred)_ are the agent's reading rather than something the
  project states.
]
