ver = 02
maindraft = draft-openconnect
draft = draft-mavrogiannopoulos-openconnect

all: $(draft)-$(ver).txt $(draft)-$(ver).html example-session1.atxt

pdf: $(draft)-$(ver).pdf

example-session1.atxt: example-session1.uml
	plantuml -txt $^

.PHONY: clean

$(draft)-$(ver).txt: $(maindraft).xml
	xml2rfc $^ -f $@

$(draft)-$(ver).html: $(maindraft).xml
	xml2rfc --html $^ -f $@

$(draft)-$(ver).pdf: $(draft)-$(ver).txt
	enscript --margins 76::76: -B -q -p - $^ | ps2pdf - $@

clean:
	rm -f $(draft)-$(ver).{txt,html,pdf}
