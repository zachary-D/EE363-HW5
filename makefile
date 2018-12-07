.PHONY: execute
.PHONY: clean
.PHONY: updateSubmission

all: Q1 Q2

Q1: UtilMethodGenerics.class

UtilMethodGenerics.class: UtilMethodGenerics.java
	javac UtilMethodGenerics.java

Q2: iter/intset/EmptyException.class iter/intset/IntSet.class

iter/intset/EmptyException.class: iter/intset/EmptyException.java
	javac iter/intset/EmptyException.java

iter/intset/IntSet.class: iter/intset/IntSet.java
	javac iter/intset/IntSet.java -cp iter/

clean:
	rm *.class -f
	rm */*.class -f
	rm submission -rdf
	rm intset -rdf


execute: all drivers


drivers: Q1Exec Q2Exec

Q1Exec: TestExchange.class TestExchange2.class
	#
	#
	#Problem 1
	java TestExchange
	#
	java TestExchange2

TestExchange.class: exchange/TestExchange.java
	javac exchange/TestExchange.java -d exchange/../

TestExchange2.class: TestExchange2.java
	javac TestExchange2.java

Q2Exec: iter/intset/drv1.class iter/intset/file2.class
	#
	#
	#Problem 2
	cd iter && java intset/drv1
	#
	cd iter && java intset/file2


iter/intset/drv1.class: iter/intset/drv1.java
	javac iter/intset/drv1.java -cp iter/

iter/intset/file2.class: iter/intset/file2.java
	javac iter/intset/file2.java -cp iter/

updateSubmission: execute #This option requires 'execute' to make sure everything compiles correctly
	rm submission -drf
	mkdir -p submission
	
#Makefile
	cp makefile submission/
	
#Q1
	cp p1README.txt submission/
	cp UtilMethodGenerics.java submission/
	cp TestExchange2.java submission/
	
#Q2
	jar --create iter/intset/IntSet.java iter/intset/file2.java p2README.txt > submission/damatozwHW5p2.jar



