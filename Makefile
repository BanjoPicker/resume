# comment 2

PDFS := coverletter.pdf \
		cl_city_boulder.pdf \
		cl_dublin.pdf \
		cl_zurich.pdf \
		cl_prague.pdf \
		cl_generic.pdf \
		resume-c++.pdf \
		resume-java.pdf \
		resume.pdf


.PHONY: all
all: $(PDFS)

.PHONY: clean
clean:
	$(RM) *.pdf *.log *.aux *.out

.PHONY: publish
publish: $(PDFS)
	for pdf in $(PDFS); do cp -f $${pdf} ~/public_html; done;

%.pdf: %.tex
	pdflatex $<

resume.pdf: resume.tex workexperience.tex skills.tex 
	pdflatex $<
