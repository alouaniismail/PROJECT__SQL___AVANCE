all: mcd mld interface_compilation clean
clean:
	rm -f *.sql~ Makefile~ *.txt~ *.jpg~ *.java~ *.class
mcd:	mcd.jpg
	display $<
mld:	mld.txt
	cat $<
interface_compilation: interfaceJDBC.java
	javac $^
