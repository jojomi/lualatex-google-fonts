# lualatex-google-fonts

Example how to use arbitrary Google Fonts in a LaTeX document (using modern lualatex)

## TL;DR

You need [**this**](fonts.pdf) in LaTeX? Then read on.

## Steps

1. Find your favorite font on [Google Fonts](https://fonts.google.com)
2. Download the font using the "**Download family**" button in the upper right corner in the font's details view.
3. Unpack the font files and move them to inside the `~/.fonts/` directory (so inside your home directory). It is okay to organize the ttf files in subdirectories or to keep them if they were in subfolders inside the archive.
4. Optionally you can update the font index manually:

    ``` shell
    luaotfload-tool --update
    ```

    If you don't do this, `lualatex` will execute it on demand on first compilation using the new font.
5. Import the `fontspec` package in your tex file and set the font for your document in the preamble:
    ``` latex
    \usepackage{fontspec}
    \setmainfont{OpenSans}[
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont={*-Bold},
        ItalicFont={*-Italic},
        BoldItalicFont={*-BoldItalic}
    ]
    %\setsansfont...
    %\setmonofont...
    ```
    Define the font types you need. Sans and mono fonts are optional, but use the same syntax.
    For more details see the [fontspec documentation](https://texdoc.org/serve/fontspec/0).

    (see [fonts.tex](fonts.tex))
6. Compile:
    ``` shell
    lualatex fonts
    ```
7. See [**result PDF**](fonts.pdf) and enjoy.

For steps 3, 4, and 6 see [fonts.sh](fonts.sh).

This guide should work on Linux and MacOS X, and it should be possible to adapt for Windows easily.

## Interesting bits about custom fonts in lualatex:

* Font names instead of filenames are possible though not easy to acquire.
* When using font names the asterisk (*) is replaced by the base font name when defining bold and italic variants (via [StackOverflow](https://tex.stackexchange.com/q/462544))