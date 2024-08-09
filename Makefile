FILENAME=amatarazzo-llm-tesis
VERSION=$(shell date +'%Y%m%d%H%M%S')

all: format
	echo $(VERSION) > ./version.tex
	mkdir -p ./out
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	biber ./out/main
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	mv ./out/main.pdf ./out/$(FILENAME).pdf
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
	open ./out/$(FILENAME).pdf