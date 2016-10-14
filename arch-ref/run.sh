#!/bin/bash

cat 0*.md App*.md > all.md

pandoc all.md -V geometry:margin=1in --template=template.tex --latex-engine=xelatex  -o epiphany_reference.pdf 

