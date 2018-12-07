.PHONY: execute
.PHONY: clean
.PHONY: updateSubmission

all: Q1

Q1: UtilMethodGenerics.class

UtilMethodGenerics.class: UtilMethodGenerics.java
	javac UtilMethodGenerics.java

clean:
	rm *.class -f
	rm */*.class -f


drivers: TestExchange.class

TestExchange.class: exchange/TestExchange.java
	javac exchange/TestExchange.java
	mv exchange/TestExchange.class /

execute: all drivers
	java TestExchange



updateSubmission: all
	rm submission -drf
	mkdir -p submission
	cp UtilMethodGenerics.java submission/
	cp TestExchange2.java submission/
	cp p1README.txt submission/
	cp makefile submission/
