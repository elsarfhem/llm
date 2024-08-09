FILENAME=amatarazzo-llm-tesis

all: format
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	biber ./out/main
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	rm -f out/${FILENAME}-*.pdf
	$(MAKE) rename
	$(MAKE) open
	$(MAKE) clean

format:
	/opt/homebrew/opt/latexindent/bin/latexindent -l localSettings.yaml -w chapters/*.tex
	/opt/homebrew/opt/latexindent/bin/latexindent -l localSettings.yaml -w main.tex
	bibtex-tidy -m refs.bib

clean:
	find . -type f -name "*.bak*" -exec rm {} \;
	find . -type f -name "*.log" -exec rm {} \;

clean-all:
	rm -f out/*
	find . -type f -name "*.bak*" -exec rm {} \;
	find . -type f -name "*.log" -exec rm {} \;

open:
	open ./out/$(FILENAME)-*.pdf

rename:
	$(eval VERSION := $(shell date +'%Y%m%d%H%M%S'))
	mv ./out/main.pdf ./out/$(FILENAME)-$(VERSION).pdf