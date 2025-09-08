SRC=$(wildcard src/[^_]*.md)
TGT=$(addsuffix .html,$(addprefix html/,$(basename $(notdir $(SRC))))) html/index.html
# Ficheros Mermaid
SRC_MMD=$(wildcard src/mmd/*.mmd)
TGT_MMD=$(addsuffix .svg,$(addprefix html/svg/mmd/,$(basename $(notdir $(SRC_MMD)))))

all: $(TGT_MMD) $(TGT)

html/index.html: src/index.html
	@cp -u $< $@; \
	echo $@;

push:
	rsync -avz html/* u48537506@home237802706.1and1-data.host:smr

html/svg/mmd/%.svg: src/mmd/%.mmd
	@mmdc -i $< -o $@; \
	echo $@;

# Crear el .html y añade los enlaces subir para cada cabecera h1 y h2
html/%.html: src/%.md
	@html_forge cabecera $<          >  $@; \
	html_forge  md2html  $<          >> $@; \
	html_forge  pie      $<          >> $@; \
	echo $@;

clean:
	rm -f $(TGT)

