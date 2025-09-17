// ÚFAL Polylux Theme
// Inspired by the ÚFAL Marp theme and Touying theme
// Built with Polylux framework

#import "@preview/polylux:0.4.0": *
#import "@preview/polylux:0.4.0": slide as polylux-slide

// ===== COLORS =====
#let ufal-orange = rgb("#f47b20")
#let ufal-gray = rgb("#EFEFEF")
#let text-color = rgb("#252525")
#let muted-color = rgb("#888888")

// ===== FONTS =====
#let font-sans = ("Fira Sans", "Liberation Sans", "Arial")
#let font-mono = ("Consolas", "Liberation Mono")

// ===== LOGOS =====
#let ufal-logo = image("img/ufal.svg", width: 1.8cm)
#let ufal-logo-title = image("img/ufal.svg", width: 1.6cm)
#let cuni-logo = image("img/cuni.svg", width: 4.5cm)
#let langtech-logo = image("img/langtech.svg", width: 3.5cm)
#let opvv-logo = image("img/opvv.svg", width: 4.2cm)
#let cc-by-sa-logo = image("img/by-sa.svg", width: 3cm)
#let cc-by-nc-sa-logo = image("img/by-nc-sa.eu.svg", width: 3cm)

// ===== SHARED COMPONENTS =====

// State to track the current slide title
#let slide-title = state("slide-title", none)

/// Creates the UFAL header bar with title and logo
/// Default settings are optimized for title slides
#let ufal-header-bar(
  title-text: none,
  title-size: 25pt,
  left-padding: 0.3cm,
  top-padding: 0.25cm,
  width: 100%,
  dx: 0cm,
) = {
  place(
    top + left,
    dx: dx,
    rect(
      width: width,
      height: 1.4cm,
      fill: ufal-gray,
      stroke: none,
    )[
      #stack(
        dir: ltr,
        spacing: 1fr,
        align(center + horizon)[
          #if title-text != none [
            #text(
              fill: ufal-orange,
              size: title-size,
              weight: "bold",
              font: font-sans,
            )[#title-text]
          ]
        ],
        align(center + horizon)[
          #scale(x: 55%, y: 55%, origin: center)[#ufal-logo]
        ],
      )
    ],
  )
}

// ===== THEME SETUP =====
#let ufal-theme(
  footer-content: "ÚFAL slides template",
  body,
) = {
  // Basic text styling
  set text(
    font: font-sans,
    size: 20pt,
    fill: text-color,
  )

  set par(
    leading: 0.9em,
    justify: false,
  )

  // Heading styles
  set heading(numbering: none)

  show heading.where(level: 1): it => {
    v(0.6em)
    set text(
      size: 1.4em,
      weight: "bold",
    )
    it
    v(0.4em)
  }

  show heading.where(level: 2): it => {
    v(0.5em)
    set text(
      size: 1.3em,
      weight: "bold",
    )
    it
    v(0.3em)
  }

  show heading.where(level: 3): it => {
    v(0.4em)
    set text(
      size: 1.2em,
      weight: "bold",
    )
    it
    v(0.2em)
  }

  show heading.where(level: 4): it => {
    v(0.3em)
    set text(
      size: 1em,
      weight: "bold",
    )
    it
    v(0.1em)
  }

  // Inline code: 1.3em makes Consolas approximately the same size as Fira Sans
  show raw.where(block: false): set text(
    font: font-mono,
    size: 1.3em,
    fill: text-color,
  )

  // Block code: 1em for better readability in code blocks
  show raw.where(block: true): set text(
    font: font-mono,
    size: 1em,
    fill: text-color,
  )

  // Use custom tmTheme for syntax highlighting
  set raw(
    theme: "ufal-syntax.tmTheme",
  )

  show raw.where(block: true): block.with(
    fill: rgb("#eeeeee"),
    inset: 0.5em,
    radius: 3pt,
    width: 100%,
  )

  // Link styling
  show link: it => {
    set text(fill: ufal-orange)
    underline(it, stroke: 2pt, offset: 0.2em)
  }

  set list(marker: (text(size: 1em)[●], text(size: 1em)[○], text(size: 0.7em)[□]))

  // Table styling
  show table: set text(size: 1em)
  show table.cell.where(y: 0): set text(weight: "bold")
  show table: set table(inset: 0.5em)

  // Page setup with header and footer
  set page(
    paper: "presentation-16-9",
    margin: (top: 2.2cm, bottom: 1.3cm, left: 1.2cm, right: 1.2cm),
    header: [
      #set align(left + top)
      #context [
        #ufal-header-bar(
          title-text: slide-title.get(),
          title-size: 25pt,
          left-padding: 0.1cm,
          top-padding: 0.5cm,
          width: 100% + 2.4cm,
          dx: -1.2cm,
        )
      ]
      #v(-0.5cm)
    ],
    footer: [
      #set align(left + bottom)

      // Only show footer if content is provided and not empty
      #if footer-content != none and footer-content != "" [
        #context [
          #let footer-text = text(
            fill: rgb("#ffffff"),
            size: 12pt,
            weight: "bold",
            font: font-sans,
          )[#footer-content]

          // Measure the text width and add some padding, with a minimum width
          #let text-width = measure(footer-text).width
          #let footer-width = calc.max(text-width + 0.8cm, 7cm)

          #place(
            bottom + left,
            dx: -1.2cm,
            dy: 0cm,
            rect(
              width: footer-width,
              height: 0.7cm,
              fill: ufal-orange,
              stroke: none,
            )[
              #align(left + horizon)[
                #pad(left: 0.3cm)[
                  #footer-text
                ]
              ]
            ],
          )
        ]
      ]

      // Pagination
      #place(
        bottom + right,
        dx: 0.5cm,
        dy: 0.3cm,
        text(
          fill: text-color,
          size: 10pt,
          font: font-sans,
        )[#toolbox.slide-number],
      )
    ],
  )

  body
}

// ===== SLIDE FUNCTIONS =====

// Override the default slide function to accept title parameter
#let slide(title: none, body) = {
  // Update the slide title state BEFORE creating the slide so the header
  // reflects the current slide's title (avoids one-slide delay).
  if title != none {
    slide-title.update(title)
  }

  polylux-slide[
    #body
  ]
}

// Title slide
#let title-slide(
  title: none,
  name: none,
  subtitle: none,
  author: none,
  date: none,
  institution: [
    Charles University\
    Faculty of Mathematics and Physics\
    Institute of Formal and Applied Linguistics
  ],
  license-type: "cc-by-sa",
  langtech: false,
) = slide[
  #set page(header: none, footer: none, margin: 0cm)

  // Header with title
  #ufal-header-bar(title-text: title)

  // Main content
  #pad(top: 3.65cm, left: 1.2cm, right: 1.2cm)[
    #if name != none [
      #text(
        size: 38pt,
        weight: "bold",
        fill: ufal-orange,
      )[#name]
      #v(-0.5cm)
    ]

    #if subtitle != none [
      #text(size: 25pt)[#subtitle]
      #v(0.5cm)
    ]

    // Author and date
    #place(
      bottom,
      dy: 5.5cm,
    )[
      #if author != none [
        #text(size: 22pt, weight: "semibold")[#author]
      ]

      #if date != none [
        #rect(
          fill: ufal-gray,
          inset: (x: 0.5em, y: 0.5em),
          radius: 0.5em,
        )[
          #stack(
            dir: ltr,
            spacing: 0.5em,
            image("img/calendar.svg", height: 0.7em),
            text(size: 18pt)[#date],
          )
        ]
      ]
    ]
  ]

  // Footer with logos
  #place(
    bottom + left,
    rect(
      width: 100%,
      height: 2.2cm,
      fill: ufal-gray,
      stroke: none,
    )[
      #place(
        left + horizon,
        dx: 0.15cm,
        stack(
          dir: ltr,
          cuni-logo,
          ufal-logo-title,
        ),
      )

      #place(
        left + horizon,
        dx: 11.5cm,
        text(size: 10pt)[#institution],
      )

      #if langtech [
        #place(
          left + horizon,
          dx: 12cm,
          stack(
            dir: ltr,
            spacing: 0.3cm,
            langtech-logo,
            opvv-logo,
          ),
        )
      ]

      // License
      #if license-type == "cc-by-sa" [
        #place(
          right + horizon,
          dx: -1.5cm,
          stack(
            dir: ttb,
            spacing: 0.2cm,
            align(center)[#cc-by-sa-logo],
            align(center)[
              #text(size: 9pt)[unless otherwise stated]
            ],
          ),
        )
      ] else if license-type == "cc-by-nc-sa" [
        #place(
          right + horizon,
          dx: -1.5cm,
          stack(
            dir: ttb,
            spacing: 0.2cm,
            align(center)[#cc-by-nc-sa-logo],
            align(center)[
              #text(size: 9pt)[unless otherwise stated]
            ],
          ),
        )
      ]
    ],
  )
]

// Part slide (section divider)
#let part-slide(title) = slide[
  #set page(header: none, footer: none, margin: 0pt, fill: ufal-gray)
  #set align(center + horizon)

  #rect(
    width: 20cm,
    height: 2cm,
    fill: ufal-orange,
    radius: 0pt,
  )[
    #align(center + horizon)[
      #text(
        fill: rgb("#ffffff"),
        size: 25pt,
        weight: "bold",
        font: font-sans,
      )[#title]
    ]
  ]

  #slide-title.update(title)
]

// ===== HELPER FUNCTIONS =====

// Definition box
#let definition(body) = {
  rect(
    fill: ufal-orange.lighten(90%),
    stroke: 2pt + ufal-orange,
    inset: 1em,
    radius: 3pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: ufal-orange)[Definition]
    #v(0.5em)
    #body
  ]
}

// Example box
#let example(body) = {
  rect(
    fill: rgb("#e8f4fd"),
    stroke: 2pt + rgb("#1f77b4"),
    inset: 1em,
    radius: 3pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#1f77b4"))[Example]
    #v(0.5em)
    #body
  ]
}

// Warning box
#let warning(body) = {
  rect(
    fill: rgb("#fff3cd"),
    stroke: 2pt + rgb("#856404"),
    inset: 1em,
    radius: 3pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#856404"))[⚠️ Warning]
    #v(0.5em)
    #body
  ]
}

// Info box
#let info(body) = {
  rect(
    fill: rgb("#d1ecf1"),
    stroke: 2pt + rgb("#0c5460"),
    inset: 1em,
    radius: 3pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#0c5460"))[💡 Info]
    #v(0.5em)
    #body
  ]
}

// Source link - small, right-aligned link for referencing sources
#let source-link(url, display-text: none) = {
  let link-text = if display-text != none { "source: " + display-text } else { url }

  place(
    bottom + right,
    dy: -0.3cm,
    text(
      size: 10pt,
      fill: muted-color,
      font: font-sans,
    )[
      #link(url)[#link-text]
    ],
  )
}
