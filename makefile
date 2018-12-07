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


drivers: TestExchange.class TestExchange2.class

TestExchange.class: exchange/TestExchange.java
	javac exchange/TestExchange.java -d exchange/../

TestExchange2.class: TestExchange2.java
	javac TestExchange2.java

execute: all drivers
	java TestExchange
	java TestExchange2


updateSubmission: all
	rm submission -drf
	mkdir -p submission
	cp UtilMethodGenerics.java submission/
	cp TestExchange2.java submission/
	cp p1README.txt submission/
	cp makefile submission/
