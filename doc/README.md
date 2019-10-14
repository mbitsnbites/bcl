# Instrucitons for building the manual

## Introduction
This document is for developers only. It briefly describes how to build the PDF manual for the Basic Compression Library (doc/manual.pdf).

## LaTeX
The manual is written in LaTeX. For those of you unfamiliar with LaTeX, it is a markup language (based on TeX), not entierly different from HTML for instance, just not quite as structured (it has its roots back in the late 1970's). For more information, go to the [TeX Users Group](http://www.tug.org).

## Figures
The figures were drawn in OpenOffice, saved as .odg (OpenDocument format) and then exported to PDF, which can be used for figures in LaTeX (when building the manual as a PDF document). Both the .odg and the .pdf versions of the figures are located in the version repository for simplicity.

Keep in mind that if a .odg file is updated, the corresponding .pdf file should be updated too!

## What you need

You need an installation of LaTeX.

Un Ubuntu, you should be good to go with:

```bash
$ sudo apt install texlive texlive-latex-extra
```
Another alternative (for Windows, for instance) is to download and install [TeX Live](http://www.tug.org/texlive/).

To update the document figures/graphics, the easiest solution is to use LibreOffice or some other software that can read OpenDocument format files and export PDF files.

## Building the PDF file

Just run `make`. Alternatively you can run `pdflatex manual.tex`, twice (for the TOC to work), and it's done.
