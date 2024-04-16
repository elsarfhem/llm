all: format
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	biber ./out/main
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	open ./out/main.pdf

format:
	/opt/homebrew/opt/latexindent/bin/latexindent -w chapters/*.tex
	/opt/homebrew/opt/latexindent/bin/latexindent -w main.tex
	bibtex-tidy -m refs.bib

clean:
	rm -f out/*
	find . -type f -name "*.bak*" -exec rm {} \;
	find . -type f -name "*.log" -exec rm {} \;