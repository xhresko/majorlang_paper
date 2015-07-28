JMENO_DOKUMENTU=major_lang_paper
SHELL=/bin/bash

all: $(JMENO_DOKUMENTU).pdf

$(JMENO_DOKUMENTU).pdf: $(JMENO_DOKUMENTU).ps
	ps2pdf $< $@
	
$(JMENO_DOKUMENTU).ps: $(JMENO_DOKUMENTU).dvi
	dvips -o $@ -D 600 -t a4 $< 	 

$(JMENO_DOKUMENTU).dvi: $(JMENO_DOKUMENTU).tex
	cslatex $<	
	cslatex $<	

clean:
	rm -f *.{log,dvi,aux,toc,lof,out} $(JMENO_DOKUMENTU).ps $(JMENO_DOKUMENTU).pdf
