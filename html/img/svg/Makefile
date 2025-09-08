SRC=$(wildcard *.mmd)
TGT=$(SRC:.mmd=.svg)

all: $(TGT)

%.pdf: %.mmd
	mmdc -i $< -w 1600 -o $@

%.png: %.mmd
	mmdc -i $< -w 1600 -o $@

%.svg: %.mmd
	mmdc -i $< -w 1600 -o $@

clean:
	rm -f *.pdf
