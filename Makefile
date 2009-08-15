VERSION = 0.3

ZIP = zip -9 -r
RM = rm -f
BROWSER = firefox

XPI=videosniffer-$(VERSION).xpi
files := \
	COPYING.txt \
	install.rdf \
	chrome.manifest \
	$(wildcard chrome/content/*) \
	$(wildcard chrome/locale/en-US/*)

$(XPI): $(files)
	$(ZIP) $@ $^

install: $(XPI)
	$(BROWSER) -no-remote -P dev $<

start:
	$(BROWSER) -no-remote -P dev

clean:
	$(RM) *.xpi

.PHONY: install clean start
