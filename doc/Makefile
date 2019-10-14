###############################################################################
# Makefile for building the Basic Compression Library manual
###############################################################################

all: manual.pdf

manual.pdf: manual.toc
	pdflatex manual.tex

manual.toc: manual.tex bcldoc.sty huffman_tree.pdf
	pdflatex manual.tex
