.PHONY: execute
.PHONY: clean


all: Q1


Q1: UtilMethodGenerics.class

UtilMethodGenerics.class: UtilMethodGenerics.java
	javac UtilMethodGenerics.java

clean:
	rm *.class
	rm */*.class


drivers: TestExchange.class

TestExchange.class: exchange/TestExchange.java
	javac exchange/TestExchange.java


execute: all drivers
	java TestExchange	
