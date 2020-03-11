# 1. Factory Method Pattern:

## What is Factory Method: 
### Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

## Problem:
### Think you have a automated pizza ordering system, it takes the pizza type from the customer and creates that type of pizza and returns it.
### Like below:
```swift
func orderPizza(type: PizzaType) -> Pizza {
    let pizza: Pizza
    switch type {
        case .cheesePizza:
            pizza = CheesePizza()
        case .greekPizza:
            pizza = GreekPizza()
        case .pepperoni:
            pizza = PepperoniPizza()
    }
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    return pizza
}
```