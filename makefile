.PHONY: execute
.PHONY: clean
.PHONY: updateSubmission

all: Q1 Q2

Q1: UtilMethodGenerics.class

UtilMethodGenerics.class: UtilMethodGenerics.java
	javac UtilMethodGenerics.java

Q2: intset/EmptyException.class intset/IntSet.class

intset/EmptyException.class: iter/intset/EmptyException.java
	javac iter/intset/EmptyException.java -d iter/intset/../../

intset/IntSet.class: iter/intset/IntSet.java
	javac iter/intset/IntSet.java -d iter/intset/../../

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

Q2Exec: drv1.class iter/intset/file2.class
	java intset/drv1
	cd iter && java intset/file2


drv1.class: iter/intset/drv1.java
	javac iter/intset/drv1.java -d iter/../

iter/intset/file2.class: iter/intset/file2.java
	javac iter/intset/file2.java -d iter/../

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



