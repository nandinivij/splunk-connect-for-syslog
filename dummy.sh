pandoc -s —pdf-engine=pdflatex -o docs.pdf $(find . -type f -name "*.md")