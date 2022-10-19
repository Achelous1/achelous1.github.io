---
layout  : wiki
title   : 추상팩토리 패턴
summary : 
date    : 2021-04-05 14:42:46 +0900
updated : 2022-10-19 21:12:54 +0900
tag     : abstract-factory design-pattern creational
toc     : true
public  : true
parent  : [[design-pattern]]
latex   : true
---
* TOC
{:toc}

# 추상팩토리 패턴에 대하여

```mermaid
classDiagram
	direction TD
	title Abstract Factory Pattern

	class Client
	<<interface>> AbstractFactory 
	<<interface>> AbstractProductA 
	class ProductA2
	class ProductA1
	class ConcreteFactory1
	class ConcreteFactory2
	<<interface>> AbstractProductB
	class ProductB1
	class ProductB2
	
	AbstractFactory <– Client
	Client -–> AbstractProductA
	Client -–> AbstractProductB
	AbstractFactory <|.. ConcreteFactory1
	AbstractFactory <|.. ConcreteFactory2
	AbstractProductA <|.. ProductA1
	AbstractProductA <|.. ProductA2
	AbstractProductB <|.. ProductB1
	AbstractProductB <|.. ProductB2
	ProductA1 <-– ConcreteFactory1
	ProductB1 <-– ConcreteFactory1
	ProductA2 <-– ConcreteFactory2
	ProductB2 <-– ConcreteFactory2
	
	Note right of Client:
	The Client is written against the
	abstract factory and then composed at
	runtime with an actual factory.

	Note left of AbstractFactory:
	The AbstractFactory defines
	the interface that all Concrete
	factories must implement which
	consists of a set of methods
	for producing products.
	
	Note “The concrete factories implement the\ndifferent product families. To create a\nproduct the client uses one of these factories,\nso it never has to instantiate a product object.” as n1
	ConcreteFactory1 .. n1
	ConcreteFactory2 .. n1
	
	Note “This is the product\nfamily. Each concrete\nfactory can produce an\nentire set of products.” as n2
	AbstractProductA .. n2
	AbstractProductB .. n2
```