all: mcd mld interface_compilation clean
clean:
	rm -f *.sql~ Makefile~ *.txt~ *.jpg~ *.java~ *.class
mcd:	mcd.jpg
	display $<
mld:	mld.txt
	cat $<
interface_compilation: interfaceJDBC.java
	javac $^
graphisme_jdbc: Main2.java
	javac $^ && java Main2
relations_totalitee_columns: Main.java
	javac $^ && java Main
