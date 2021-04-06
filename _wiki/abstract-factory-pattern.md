---
layout  : wiki
title   : 추상팩토리 패턴
summary : 
date    : 2021-04-05 14:42:46 +0900
updated : 2021-04-05 17:33:08 +0900
tag     : abstract-factory design-pattern
toc     : true
public  : true
parent  : [[design-pattern]]
latex   : true
---
* TOC
{:toc}

# 추상팩토리 패턴에 대하여

![]({{site.baseurl}}/assets/uml/singleton.png)

{% plantuml %}
skinparam componentStyle uml2

title Abstract Factory Pattern

class Client
class AbstractFactory <<interface>>
class AbstractProductA <<interface>>
class ProductA2
class ProductA1
class ConcreteFactory1
class ConcreteFactory2
class AbstractProductB <<interface>>
class ProductB1
class ProductB2

AbstractFactory <– Client
Client –> AbstractProductA
Client –> AbstractProductB
AbstractFactory <|.. ConcreteFactory1
AbstractFactory <|.. ConcreteFactory2
AbstractProductA <|.. ProductA1
AbstractProductA <|.. ProductA2
AbstractProductB <|.. ProductB1
AbstractProductB <|.. ProductB2
ProductA1 <– ConcreteFactory1
ProductB1 <– ConcreteFactory1
ProductA2 <– ConcreteFactory2
ProductB2 <– ConcreteFactory2

note right of Client
The Client is written against the
abstract factory and then composed at
runtime with an actual factory.
end note

note left of AbstractFactory
The AbstractFactory defines
the interface that all Concrete
factories must implement which
consists of a set of methods
for producing products.
end note

note “The concrete factories implement the\ndifferent product families. To create a\nproduct the client uses one of these factories,\nso it never has to instantiate a product object.” as n1
ConcreteFactory1 .. n1
ConcreteFactory2 .. n1

note “This is the product\nfamily. Each concrete\nfactory can produce an\nentire set of products.” as n2
AbstractProductA .. n2
AbstractProductB .. n2
{% endplantuml %}