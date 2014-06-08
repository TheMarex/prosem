## Encoding: ISO8859-1 ##

MASTER = gems-latex-template-sose14
ZIPNAME = gems-latex-template-sose14.zip
SUBDIR = Niklaus
.PHONY: clean

pdf:
	pandoc --template $(SUBDIR)/template.tex $(SUBDIR)/RandomWalk.md -o $(SUBDIR)/RandomWalk.tex
	rm -f $(MASTER).pdf
	pdflatex $(MASTER).tex
	bibtex $(SUBDIR) || true
	bibtex $(MASTER) || true
	pdflatex $(MASTER).tex
	pdflatex $(MASTER).tex


clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.toc
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.bbl
	rm -f *.blg
	rm -f *.zip
	rm -f $(SUBDIR)/*.aux


zip: clean
	zip $(ZIPNAME) *
	zip $(ZIPNAME) logos/*
	zip $(ZIPNAME) $(SUBDIR)/*

bundle: pdf clean zip
