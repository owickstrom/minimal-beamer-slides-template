TEX=pdflatex
NODEMON=node_modules/.bin/nodemon

MASTER=src/master.tex
TEX_OPTIONS=options.tex
SRCS=$(shell find src -name '*.tex') \
		 $(shell find src/listings)

SLIDES_DIR=target/slides
SLIDES=$(SLIDES_DIR)/slides.pdf

SLIDES_NO_NOTES_DIR=target/slides-no-notes
SLIDES_NO_NOTES=$(SLIDES_NO_NOTES_DIR)/slides-no-notes.pdf

.PHONY: slides
slides: $(SLIDES) $(SLIDES_NO_NOTES)

$(SLIDES): $(SRCS)
	rm -rf $(SLIDES_DIR)
	mkdir -p $(SLIDES_DIR)
	cp -r src $(SLIDES_DIR)/src
	echo "\setbeameroption{show notes on second screen}" \
		> $(SLIDES_DIR)/$(TEX_OPTIONS)
	cd $(SLIDES_DIR) && \
	$(TEX) \
		-jobname slides \
		-halt-on-error \
		$(MASTER)

$(SLIDES_NO_NOTES): $(SRCS)
	rm -rf $(SLIDES_NO_NOTES_DIR)
	mkdir -p $(SLIDES_NO_NOTES_DIR)
	cp -r src $(SLIDES_NO_NOTES_DIR)/src
	echo "" > $(SLIDES_NO_NOTES_DIR)/$(TEX_OPTIONS)
	cd $(SLIDES_NO_NOTES_DIR) && \
		$(TEX) \
		-jobname slides-no-notes \
		-halt-on-error \
		$(MASTER)

$(NODEMON):
	npm install nodemon

.PHONY: watch
watch: $(NODEMON)
	$(NODEMON) -w src -e tex,oden -x 'make slides || true'

present: $(SLIDES)
	pdfpc \
		--notes=right \
		--disable-auto-grouping \
		$(SLIDES)

clean:
	rm -rf target
