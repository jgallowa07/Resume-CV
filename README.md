# Resume-CV
A place to be a *little* self-centered.

## Building the CV

The CV source lives in `CV/`. Building requires a TeX distribution that provides
`pdflatex` and `bibtex` (on macOS: [MacTeX](https://www.tug.org/mactex/); on
Linux: TeX Live).

```sh
cd CV
./build.sh
```

This regenerates `CV/Jared_Galloway_CV.pdf` from `CV/main.tex`.

### Why the multi-pass build

The document uses the `multibib` package to keep two separate bibliographies —
first/co-first author publications (`first.bib`) and supporting author
publications (`supporting.bib`). `multibib` writes their citation data to
`prim.aux` and `supp.aux`, so `bibtex` is run against **those** aux files (not
`first.aux` / `supporting.aux`). `build.sh` handles the full
`pdflatex → bibtex prim → bibtex supp → pdflatex → pdflatex` sequence.
