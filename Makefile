clean:
	rm -f *.sql~ Makefile~ *.txt~ *.jpg~
mcd:	mcd.jpg
	display $<
mld:	mld.txt
	cat $^
