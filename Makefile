DOC_NAME=major_lang_paper
SHELL=/bin/bash
LATEX = latex
BIBTEX = bibtex

PDF = ps2pdf
PS = dvips
PS_FLAGS = -D 600 -t a4

all: $(DOC_NAME).pdf

%.pdf: %.ps
	$(PDF) $<

%.ps: %.dvi
	$(PS) $(PS_FLAGS) $< -o $@

$(DOC_NAME).dvi: $(wildcard *.tex) $(wildcard *.bib) $(wildcard images/*.eps)
	$(LATEX) ${@:.dvi=}
	$(BIBTEX) ${@:.dvi=}
	$(LATEX) ${@:.dvi=}
	$(LATEX) ${@:.dvi=}

clean:
	rm -rRf *.dvi *.aux *.blg *.log *.ps *~ *.bbl *.pdf *.out
