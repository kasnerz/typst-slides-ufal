#import "ufal.typ": *

#show: ufal-theme.with(
  footer-content: "ÚFAL Typst Template",
)

// Set document properties
#set document(
  title: "ÚFAL Typst Slides Template",
  author: "Zdeněk Kasner",
)

#title-slide(
  title: "Example slide deck",
  name: "ÚFAL slides template",
  subtitle: "This time in Typst!",
  author: "Zdeněk Kasner",
  date: "16 Sep 2025",
  license-type: "cc-by-sa",
)

#part-slide("What is this?")

#slide(title: "ÚFAL Typst Theme")[
  #toolbox.side-by-side(gutter: 3mm, columns: (2fr, 1.5fr))[
    === What is this?

    - This slide deck is created with
      *#link("https://polylux.dev/book/polylux.html")[Typst]* (a markup-based typesetting system) and *#link("https://polylux.dev/book/polylux.html")[Polylux]* (a Typst package adding some extra magic for slides).

    - It is styled with the `ufal.typ` template:
      - Inspired by the #link("https://github.com/kasnerz/marp-ufal")[ÚFAL Marp template], which is in turn inspired by the #link("https://docs.google.com/presentation/d/1cE1fyaG9qWXJo5Upzi_i8mXMqUGbuYDgwqvHGYRgBSE/edit?usp=sharing")[ÚFAL Google Slides template] and Milan Straka's #link("https://github.com/ufal/slimd")[SliMD template].
      #v(1fr)
  ][
    #align(center + horizon)[
      #image("img/typst_logo.svg", width: 60%)
    ]
  ]
]

#slide(title: "ÚFAL Typst Theme")[
  === Main features

  #set list(marker: none, indent: -8pt)
  - 📝 *Easy editing*: Create slides in your favourite text editor with live preview.
  - 🔄 *Git-friendly*: You can version-control your presentations.
  - 🖲️ *Multiple export formats*: Export to PDF or PNG.
  - 🪧 *LaTeX support*: Mathematical typesetting with native Typst math.
  - ⚡️ *Advanced typography*: Use Typst's powerful layout system.
  - ✒️ *Consistency*: Everything is nice and aligned without too much effort.
  - 🦶 *Auto footer*: No more manual copying of the bottom orange bar 💪
  - 🚀 *Modern framework*: Typst has excellent documentation and growing community.
]

#slide(title: "Typst vs Marp ⚔️")[
  _Should I use this template, or the Marp template?_

  #text(size: 18pt)[
    #align(center)[
      #table(
        columns: 3,
        align: (left, left, left),
        stroke: 0.5pt + gray,
        table.header[*Feature*][*Typst*][*Marp*],

        [*Syntax*], [Custom markup language], [#text(fill: gray)[Markdown-based]],

        [*Advanced layout*], [Full programmatic control], [#text(fill: gray)[CSS themes]],

        [*Output formats*], [PDF, PNG, SVG], [#text(fill: gray)[PDF, HTML, PNG, PPTX]],

        [*Live preview*], [Multiple editor options], [#text(fill: gray)[VS Code extension]],

        [*Performance*], [Very fast compilation], [#text(fill: gray)[Fast compilation]],

        [*Collaboration*], [Git-friendly text files], [#text(fill: gray)[Git-friendly Markdown]],

        [*Advanced layouts*], [Powerful layout system], [#text(fill: gray)[Limited (CSS grid/flexbox)]],

        [*Package ecosystem*], [Growing (Typst packages)], [#text(fill: gray)[Mature (npm packages)]],

        [*Best for*], [Complex layouts, Typography], [#text(fill: gray)[Quick slides, Markdown users]],
      )
    ]
  ]
]


#part-slide("How to use it?")

#slide(title: "Typst Syntax 101")[
  You need to use #link("https://typst.app/docs/tutorial/")[Typst markup syntax].

  === This is an H3 header.
  - This is a bulleted list.
    - With a nested item.
  + And this is a numbered list.

  You can also use *bold text*, _italic text_, #link("https://ufal.cz")[links], `monospace`, etc.

  Each slide is created by calling a function like `#slide[content]`.

  ---

  #text(
    size: 15pt,
    fill: muted-color,
  )[With Typst, you can very easily modify any layout or text properties to your liking.]
]

#slide(title: "Slide layouts")[
  This template uses #link("https://polylux.dev/book/polylux.html")[Polylux], which provides various layout options:

  - Use `#slide[content]` for regular slides
  - Use `#part-slide("title")` for section dividers
  - Use `toolbox.side-by-side` for two-column layouts
  - Use alignment functions like `#align(center)` for positioning

  You can also create specialized boxes with helper functions:
  - `#definition[content]` for definition boxes
  - `#example[content]` for example boxes
  - `#warning[content]` for warning boxes
  - `#info[content]` for info boxes
]

#slide(title: "Working with images")[

  #set align(center + horizon)

  == Image placement and sizing

  Use Typst's image syntax to include an image:
  ```typst
  #image("img/transformer.png", height: 3cm)
  ```

  #image("img/transformer.png", height: 3cm)
]

#blank-slide[
  #align(center + horizon)[
    == LaTeX typesetting

    You can render both inline math  and separate equations:

    $cal(L)(theta) = sum_(i=1)^n log p(y_i | x_i, theta) - lambda ||theta||_2^2$


    #v(20pt)

    #warning[
      #link("https://typst.app/docs/reference/math/")[Typst math syntax] is *different* from the LaTeX syntax.

      Use this #link("https://qwinsi.github.io/tex2typst-webapp/")[online convertor] to convert your equations between these two.

    ]

    #text(size: 15pt, fill: muted-color)[This slide uses the `#blank-slide` class.]
  ]
]

#slide(title: "Code blocks & columns")[
  #toolbox.side-by-side[
    === Python code

    Syntax highlighting is supported:

    ```python
    def factorial(n):
        if n == 0:
            return 1
        else:
            return n * factorial(n - 1)
    ```
  ][
    === Javascript code

    ```javascript
    function greet(name) {
        console.log(`Hello, ${name}!`);
    }
    ```
  ]

  #note[ Use `toolbox.side-by-side` to display content in multiple columns.]
]

#slide(title: "Tables")[
  #align(center)[
    #table(
      columns: 4,
      align: center,
      table.header[*Model*][*Metric 1*][*Metric 2*][*Rating*],
      [not LLM 1], [14.5], [🟠], [Mediocre],
      [not LLM 2], [5.5], [🔶], [Worst],
      [not LLM 3], [6.9], [🟧], [Even worse],
      [LLM], [*99.8*], [🧡], [Greatest thing ever!],
    )
  ]

  - Tables automatically get proper styling.
  - You can add source links using the `source-link` function (see bottom right).

  // Add a source link - small and right-aligned
  #source-link("https://example.com/our-experiments", display-text: "Our experiments")
]

#slide(title: "Animated lists")[
  === How to animate lists
  #item-by-item[
    - first
    - second
    - third
  ]
]

#part-slide("Practical tips")

#slide(title: "Development")[

  === Live preview
  Use any text editor with Typst support for *live preview*:
  - VS Code with the #link("https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist")[Tinymist Typst extension]
  - Neovim with typst.vim
  - Online #link("https://typst.app")[Typst web app] (useful also for collaboration)

  === Compilation CLI

  ```bash
  $ typst compile slides.typ slides.pdf
  $ typst watch slides.typ slides.pdf  # Auto-recompile
  ```

  #align(center)[
    #rect(
      fill: ufal-gray,
      stroke: 1pt + ufal-orange,
      width: 8cm,
      height: 3cm,
    )[
      #align(center + horizon)[
        #text(fill: ufal-orange, weight: "bold")[Live Preview Screenshot]
      ]
    ]
  ]
]

#slide(title: "Export formats")[
  #set align(center + horizon)
  == Export to PDF and PNG

  === Typst CLI

  ```bash
  $ typst compile slide-deck.typ output.pdf
  $ typst compile slide-deck.typ output.png
  ```

  === VS Code

  Use the Typst extension to compile directly in the editor.
]

#slide(title: "Links")[
  - #link("https://typst.app/docs/")[Typst Documentation]
  - #link("https://sitandr.github.io/polylux/book/polylux.html")[Polylux: Presentation slides in Typst]
  - #link("https://github.com/touying-typ/touying")[Touying: Modern presentation framework for Typst]
  - #link("https://github.com/typst/packages")[Typst Packages Repository]
  - #link("https://discord.gg/2uDybryKPe")[Typst Community Discord]
  - #link("https://github.com/kasnerz/marp-ufal")[Original ÚFAL Marp Theme]
]

#slide[
  #set page(header: none, footer: none, margin: 0cm)
  #set align(center + horizon)

  #rect(
    width: 100%,
    height: 100%,
    fill: ufal-gray,
    stroke: none,
  )

  #rect(
    width: 20cm,
    fill: rgb("#ffffff"),
    stroke: 0.15cm + ufal-orange,
    inset: (x: 1.5cm, y: 0.5cm),
  )[
    #rect(
      width: 100%,
      fill: ufal-orange,
      inset: (x: 0.5cm, y: 0.1cm),
    )[
      #align(center)[
        #text(
          fill: rgb("#ffffff"),
          size: 10pt,
          weight: "bold",
        )[ÚFAL Typst Template]
      ]
    ]
    #v(0.5cm)

    #align(center)[
      #text(
        size: 22.5pt,
        weight: "bold",
        fill: ufal-orange,
      )[Summary]
    ]
    #v(0.5cm)

    - This template is...
      - _not_ as tremendous as the LaTeX one.
      - _not_ that easy to collaborate on as the Google Slides one.
      - _not_ equipped with as many features as the SliMD one.
    - *But it is simple to use and looks great.*

    === github.com/kasnerz/typst-ufal (coming soon)
  ]
]

#slide(title: "Bonus features")[
  == Advanced layouts

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    rect(fill: ufal-orange.lighten(80%), inset: 1em)[
      *Panel 1*

      Content for the first panel with some interesting information.
    ],
    rect(fill: ufal-orange.lighten(80%), inset: 1em)[
      *Panel 2*

      Some other content that fits nicely in this structured layout.
    ],
    rect(fill: ufal-orange.lighten(80%), inset: 1em)[
      *Panel 3*

      Yet another content section with additional details.
    ],
  )

  == Mathematical expressions

  Typst excels at mathematical typesetting:
  $integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2$
]
