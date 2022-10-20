---
layout  : wiki
title   : 추상팩토리 패턴
summary : 
date    : 2021-04-05 14:42:46 +0900
updated : 2022-10-20 11:06:54 +0900
tag     : abstract-factory design-pattern creational
toc     : true
public  : true
parent  : [[design-pattern]]
latex   : false
mermaid : true
---
* TOC
{:toc}

# 추상팩토리 패턴에 대하여

```mermaid
classDiagram
direction TD

class Client
class AbstractFactory{
<<interface>>
}
class AbstractProductA{
<<interface>>
}
class ProductA2
class ProductA1
class ConcreteFactory1
class ConcreteFactory2
class AbstractProductB{
<<interface>>
}
class ProductB1
class ProductB2

class Note1 {
	The Client is written\n against the abstract factory\n and then composed at runtime\n with an actual factory
}

class Note2 {
	The AbstractFactory defines\n the interface that all Concrete factories\n must implement which consists of a\n set of methods for producing products.
}

class Note3 {
	The concrete factories implement the\n different product families. To create a\n product the client uses one of these factories,\n so it never has to instantiate a product object
}

class Note4 {
	This is the product\nfamily. Each concrete\nfactory can produce an\nentire set of products.
}

Client --> AbstractFactory
Client --> AbstractProductA 
Client --> AbstractProductB
Client .. Note1
AbstractFactory <|.. ConcreteFactory1
AbstractFactory <|.. ConcreteFactory2
AbstractFactory .. Note2
AbstractProductA <|.. ProductA1
AbstractProductA <|.. ProductA2
AbstractProductB <|.. ProductB1
AbstractProductB <|.. ProductB2
ProductA1 <-- ConcreteFactory1
ProductB1 <-- ConcreteFactory1
ProductA2 <-- ConcreteFactory2
ProductB2 <-- ConcreteFactory2
ConcreteFactory1 .. Note3
ConcreteFactory2 .. Note3
AbstractProductA .. Note4
AbstractProductB .. Note4

```