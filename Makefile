HTML2MARKDOWN=html2text
PYTHON=python
PYTHONFLAGS=
SPECSPLITTER=spec-splitter.py
SPECSPLITTERFLAGS=
SINGLEPAGE=index.html
MULTIPAGE=multi.html
MULTIPAGECOPY=spec.html

all: $(MULTIPAGE) $(MULTIPAGECOPY) README.md

README.md: README.html
	$(HTML2MARKDOWN) $(HTML2MARKDOWNFLAGS) $< > $@

$(MULTIPAGE): index.html
	$(PYTHON)$(PYTHONFLAGS) $(SPECSPLITTER) $(SPECSPLITTERFLAGS) $< .

$(MULTIPAGECOPY): $(MULTIPAGE)
	cp $< $@

clean:
	$(RM) $(MULTIPAGE)
	$(RM) $(MULTIPAGECOPY)
	$(RM) README.md
