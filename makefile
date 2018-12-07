.PHONY: execute
.PHONY: clean
.PHONY: updateSubmission

all: Q1 Q2

Q1: UtilMethodGenerics.class

UtilMethodGenerics.class: UtilMethodGenerics.java
	javac UtilMethodGenerics.java

Q2: EmptyException.class IntSet.class

EmptyException.class: iter/intset/EmptyException.java
	javac iter/intset/EmptyException.java -d iter/intset/../../

IntSet.class: ntSet.java IntSet.java
	javac IntSet.java

clean:
	rm *.class -f
	rm */*.class -f
	rm submission -rdf
	rm intset -rdf


execute: all drivers
	java TestExchange
	java TestExchange2


drivers: Q1Exec Q2Exec

Q1Exec: TestExchange.class TestExchange2.class

TestExchange.class: exchange/TestExchange.java
	javac exchange/TestExchange.java -d exchange/../

TestExchange2.class: TestExchange2.java
	javac TestExchange2.java

Q2Exec: drv1.class file2.class
	java drv1


drv1.class: iter/intset/drv1.java
	javac iter/intset/drv1.java -d iter/../

file2.class: file2.java
	javac file2.java

updateSubmission: all
	rm submission -drf
	mkdir -p submission
	
#Makefile
	cp makefile submission/
	
#Q1
	cp p1README.txt submission/
	cp UtilMethodGenerics.java submission/
	cp TestExchange2.java submission/
	
#Q2
	cp p2README.txt submission/
	cp iter/intset/IntSet.java submission/
	cp file2.java submission/



