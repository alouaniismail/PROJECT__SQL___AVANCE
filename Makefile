clean:
	rm -f *.sql~ Makefile~ *.txt~ *.jpg~ *.java~
mcd:	mcd.jpg
	display $<
mld:	mld.txt
	cat $^
