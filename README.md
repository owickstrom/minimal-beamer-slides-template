# minimal-beamer-talk-template

This repository contains a minimal template for LaTeX Beamer talks. I extracted
this from my talks as I found the styling very nice and focused on the content.
All of the default navigation mumbo jumbo has been removed. It uses *Fira Sans*
and *Fira Code* throughout.

It is configured to produce two PDFs, one with notes and one without. The notes
are placed on the right of the main content, in a double-width PDF. You can use
[SplitShow](https://github.com/mpflanzer/splitshow) in OS X and
[pdfpc](https://pdfpc.github.io/) in Linux to display the slides on an external
monitor and your notes on your laptop screen.

## Samples

* [Slides With Notes](samples/slides.pdf)
* [Slides Without Notes](samples/slides-no-notes.pdf)

## Usage

1. Clone this repository and delete the `.git` directory, or just download the
  files.
1. Remove the `samples` directory.
1. Start editing `src/metadata.tex` and `src/slides.tex` as described below.
1. Run `make` or `make watch` (see [Build](#build)).

### Metadata

The file `src/slides.tex` contains the data needed to create the title page
and the Twitter handle in the footer. The default one includes
`src/graphics/logo.png`, a placeholder which you can either remove or replace.

### Slides

The file `src/slides.tex` is where you write your slides. The template includes
some handy commands for the things I use regularly, like big centered headings
and emphasized short texts.

The first slide uses `\titlepage`, you can leave that as is.


```latex
\begin{frame}
  \titlepage
  \note[item]{All right, here we go.}
\end{frame}
```

You can either use `\note[item]{...}` like in the previous example, or the
custom `\notelist` command:

```latex
\begin{frame}
  \notelist{
    \item A bit easier, I think
  }
\end{frame}
```

There's three custom commands for centered text:

* `\singletitle` for section titles
* `\singlesubheading` for sub-sections
* `\singletext` for emphasizing a short quote or statement

For including text, the template favors the `listings` package together with an
adaptation of the [Paramount color scheme](https://wickstrom.tech/programming/2016/05/15/paramount-color-scheme-for-vim.html).

```latex
\begin{frame}
  \frametitle{Code Listing}
  \lstinputlisting[language=c]{src/listings/hello.c}
  \notelist{
    \item Hello world is a cool example
  }
\end{frame}
```

### Dark Theme

If you want a dark theme for your slides, remove the comment in `src/master.tex`
before the include:

```latex
% Uncomment to enable dark theme:
%\include{src/includes/dark-theme}
```

## Build

Run `make` to produce the PDFs.

```bash
make
```

You should now have `target/slides/slides.pdf` and
`target/slides-no-notes/slides-no-notes.pdf`.

If you have NodeJS you can also run the watched build:

```bash
make watch
```

## License

The MIT License (MIT)

Copyright (c) 2016, Oskar Wickström

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
