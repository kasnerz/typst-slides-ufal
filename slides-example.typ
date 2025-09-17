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
  #toolbox.side-by-side[
    === What is this?

    - This slide deck is created in *Typst*, a modern markup-based typesetting system.

    - It is styled with the `ufal.typ` template:
      - Inspired by the ÚFAL #link("https://docs.google.com/presentation/d/1cE1fyaG9qWXJo5Upzi_i8mXMqUGbuYDgwqvHGYRgBSE/edit?usp=sharing")[Google Slides template] and Milan Straka's #link("https://github.com/ufal/slimd")[SliMD template].
      - You can also contribute! 🫵
  ][
    #align(center)[
      #rect(
        width: 6cm,
        height: 4cm,
        fill: ufal-gray,
        stroke: 1pt + ufal-orange,
      )[
        #align(center + horizon)[
          #text(size: 20pt, weight: "bold", fill: ufal-orange)[Typst Logo]
        ]
      ]
    ]
  ]
]

#slide(title: "ÚFAL Typst Theme")[
  === Main features

  - 📝 *Easy editing*: Create slides in your favourite text editor with live preview.
  - 🔄 *Git-friendly*: You can version-control your presentations.
  - 🖲️ *Multiple export formats*: Export to PDF or PNG.
  - 🪧 *LaTeX support*: Mathematical typesetting with native Typst math.
  - ⚡️ *Advanced typography*: Use Typst's powerful layout system.
  - ✒️ *Consistency*: Everything is nice and aligned without too much effort.
  - 🦶 *Auto footer*: No more manual copying of the bottom orange bar 💪
  - 🚀 *Modern framework*: Typst has excellent documentation and growing community.
]

#part-slide("How to use it?")

#slide(title: "Typst Syntax 101")[
  You can use Typst's markup syntax for creating slides.

  === This is an H3 header.
  - This is a bulleted list.
    - With a nested item.
  + And this is a numbered list.

  You can also use *bold text*, _italic text_, #link("https://ufal.cz")[links], `monospace`, etc.

  Each slide is created by calling a function like `#slide[content]`.

  ---

  #text(size: 12pt, fill: muted-color)[You can also use advanced Typst features for tweaks.]
]

#slide(title: "Slide layouts")[
  This template uses Polylux, which provides various layout options:

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
  _[source: Our experiments]_

  == Image placement and sizing

  Use Typst's image syntax to include an image:
  ```typst
  #image("img/transformer.png", height: 3cm)
  ```

  #align(center)[
    #rect(
      fill: ufal-gray,
      stroke: 1pt + ufal-orange,
      width: 4cm,
      height: 2cm,
    )[
      #align(center + horizon)[
        #text(fill: ufal-orange, weight: "bold")[Image Placeholder]
      ]
    ]
  ]
]

#slide[
  #set page(header: none, footer: none, margin: 1.2cm)
  #align(center + horizon)[
    == LaTeX typesetting

    You can render both inline $cal(L)$ and separate equations:

    $$ cal(L)(theta) = sum_(i=1)^n log p(y_i | x_i, theta) - lambda ||theta||_2^2 $$

    #text(size: 12pt, fill: muted-color)[This slide demonstrates mathematical typesetting.]
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
    Use `toolbox.side-by-side` for multiple columns.

    === Javascript code

    ```javascript
    function greet(name) {
        console.log(`Hello, ${name}!`);
    }
    ```
  ]
]

#slide(title: "Tables")[
  _[source: Our experiments]_

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

  - You can add a source link using _italic text_.
  - Tables automatically get proper styling.
]

#slide(title: "Animated lists")[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      === How to animate lists
      #uncover("2-")[
        - This is a *bulleted list* 💣️
        - How is that possible?
        - Because we use Typst! 💡
      ]
    ],
    [
      #uncover("3-")[
        + Similarly, this numbered list
        + Can be animated in presentations
        + Of course this works in PDF too
      ]
    ],
    [
      === Features
      #uncover("4-")[
        - Clean typography
        - Easy markup
        - Professional output
      ]
    ],
  )
]

#part-slide("Practical tips")

#slide(title: "Development")[
  == Typst editor support

  Use any text editor with Typst support for *live preview*:
  - VS Code with Typst LSP extension
  - Neovim with typst.vim
  - Built-in Typst web app

  == Typst CLI compilation

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
