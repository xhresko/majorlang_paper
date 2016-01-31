DOC_NAME=major_lang_paper
SHELL=/bin/bash
LATEX = pdflatex
BIBTEX = bibtex

all: $(DOC_NAME).pdf

$(DOC_NAME).pdf: $(wildcard *.tex) $(wildcard *.bib) $(wildcard images/*.eps)
	$(LATEX) ${@:.pdf=}
	$(BIBTEX) ${@:.pdf=}
	$(LATEX) ${@:.pdf=}
	$(LATEX) ${@:.pdf=}

clean:
	rm -rRf *.dvi *.aux *.blg *.log *.ps *~ *.bbl *.pdf *.out
