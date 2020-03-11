# 1. Factory Method Pattern:

### What is Factory Method: 
#### Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

### Problem:
#### Think you have a automated pizza ordering system, it takes the pizza type from the customer and creates that type of pizza and returns it.
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
#### This is perfectly fine until you face a change in pizza type. and what if your boss have opened a new branch of pizza shop, then what you need to do?. You have to add another case to your orderPizza method and this same change mush me applied to every branch of pizza shop.

#### To resolve this issue factory method comes in, it separates the logical part of the pizza creation to somewhere else and we call it ```PizzaFactory``` which does only one task it just creates pizza depending on pizza catagory. Now whoever needs the pizza he just asks to Pizza factory for a Pizza and gets the pizza.

### Our Pizza Factory Looks Like Bellow:
```swift
protocol PizzaFactory() {
    func makePizza(type: PizzaType) -> Pizza
}

class MainFactory: PizzaFactory {
    func makePizza(type: PizzaType) -> Pizza {
       switch type {
        case .cheesePizza:
            return CheesePizza()
        case .greekPizza:
            return GreekPizza()
        case .pepperoni:
            return PepperoniPizza()
        } 
    }
}
```