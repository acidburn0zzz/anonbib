
PYTHON=python2
VERSION=0.1

all:
	$(PYTHON) writeHTML.py

clean:
	rm -f *~ */*~ *.pyc *.pyo

update: 
	$(PYTHON) updateCache.py

veryclean: clean
	rm -f author.html date.html topic.html bibtex.html tmp.bib

TEMPLATES=_template_.html
CSS=css/main.css css/pubs.css
BIBTEX=anonbib.bib
SOURCE=BibTeX.py config.py metaphone.py reconcile.py updateCache.py \
	writeHTML.py
EXTRAS=TODO README Makefile

DISTFILES=$(TEMPLATES) $(CSS) $(BIBTEX) $(SOURCE) $(EXTRAS)

dist: clean
	rm -rf anonbib-$(VERSION)
	mkdir anonbib-$(VERSION)
	tar cf - $(DISTFILES) | (cd anonbib-$(VERSION); tar xf -)
	mkdir anonbib-$(VERSION)/cache
	tar czf anonbib-$(VERSION).tar.gz anonbib-$(VERSION)
	rm -rf anonbib-$(VERSION)