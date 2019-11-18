OBJDIR = build
AUX = .aux .log .toc .fls .fdb_latexmk .bbl .blg .out .lof .lot .bcf .run.xml

LMKCONT = -pvc -view=none
LMKOPTS = -pdf -output-directory=${OBJDIR}
LMKOPTS += `if [ -n "${CONT}" ]; then echo "${LMKCONT}"; fi`

LMKVARS = TEXINPUTS=${TEXINPUTS}:texmf
LATEXMK = ${LMKVARS} latexmk ${LMKOPTS}

.SUFFIXES: .pdf .tex
.PHONY: kandidatrapport

all: stadgar

stadgar: stadgar/stadgar.pdf

publish: stadgar
	cp build/stadgar.pdf pdf

.tex.pdf:
	${LATEXMK} $<

clean:
	for ft in ${AUX}; do rm -rf $$(find . -name "*$$ft"); done

distclean:
	rm -rf ${OBJDIR}
