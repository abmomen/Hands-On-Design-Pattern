# 1. Factory Method Pattern:

### What is Factory Method: 
Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

### Problem:
Think you have a automated pizza ordering system, it takes the pizza type from the customer and creates that type of pizza and returns it.
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
This is perfectly fine until you face a change in pizza type, and what if your boss have opened a new branch of pizza shop, then what you need to do?. You have to add another case to your orderPizza method and this same change mush me applied to every branch of pizza shop.

To resolve this issue factory method comes in, it separates the logical part of the pizza creation to somewhere else and we call it ```PizzaFactory``` which does only one task it just creates pizza depending on pizza catagory. Now whoever needs the pizza he just asks to Pizza factory for a Pizza and gets the pizza.

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
Now in ```orderPizza(type: PizzaType)``` method we just do the following.
```swift
func orderPizza(type: PizzaType) -> Pizza{
    let factory = MainFactory()
    let pizza = factory.makePizza(type)
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    return pizza
}
```
Thats it where ever you need a pizza just ask to pizza factory you will get it. and if your boss brings more pizza item to the menu you just need to change in only one place.
#### [To see the full implementation please have a look at it](https://github.com/abmomin/Hands-On-Design-Pattern/blob/master/Source/Creational%20Design%20Pattern/Factory%20Method/FactoryMethod.swift)