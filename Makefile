ver = 01
draft = draft-openconnect

all: $(draft)-$(ver).txt $(draft)-$(ver).html

pdf: $(draft)-$(ver).pdf

.PHONY: clean

$(draft)-$(ver).txt: $(draft).xml
	xml2rfc $^ -f $@

$(draft)-$(ver).html: $(draft).xml
	xml2rfc $^ -f $@

$(draft)-$(ver).pdf: $(draft)-$(ver).txt
	enscript --margins 76::76: -B -q -p - $^ | ps2pdf - $@

clean:
	rm -f $(draft)-$(ver).{txt,html,pdf}
