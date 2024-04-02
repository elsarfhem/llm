all:
	#latexindent -w chapters/*.tex
	#latexindent -w main.tex
	#bibtex-tidy -m refs.bib
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	biber ./out/main
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=/Users/amatarazzo/git-repos/llm/out main.tex
	open ./out/main.pdf

clean:
	rm -f out/*
	rm -f *.bak*
	rm -f chapters/*.bak*