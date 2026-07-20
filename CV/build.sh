#!/usr/bin/env bash
# Build Jared_Galloway_CV.pdf from main.tex.
#
# Requires a TeX distribution providing pdflatex and bibtex (e.g. MacTeX / TeX Live).
#
# The CV uses the `multibib` package with two bibliographies declared via
# \newcites{prim}{...} and \newcites{supp}{...}. multibib writes their citation
# data to prim.aux and supp.aux (NOT first.aux / supporting.aux), so bibtex must
# be run against those two aux files — hence the four-pass sequence below.

set -euo pipefail
cd "$(dirname "$0")"

pdflatex -interaction=nonstopmode -halt-on-error main.tex   # generate .aux files
bibtex prim                                                 # first/co-first author bib
bibtex supp                                                 # supporting author bib
pdflatex -interaction=nonstopmode -halt-on-error main.tex   # resolve citations
pdflatex -interaction=nonstopmode -halt-on-error main.tex   # settle cross-references

cp main.pdf Jared_Galloway_CV.pdf
echo "Built Jared_Galloway_CV.pdf"
