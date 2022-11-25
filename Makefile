clean:
	rm -f *.sql~ Makefile~ *.txt~ *.jpg~ *.java~ *.class
mcd:	mcd.jpg
	display $<
mld:	mld.txt
	cat $^
