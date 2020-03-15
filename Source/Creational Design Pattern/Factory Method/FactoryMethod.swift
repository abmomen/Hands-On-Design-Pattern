//Types of Pizza
enum PizzaType {
    case cheesePizza, greekPizza, pepperoni
}
protocol Pizza {
    func prepare()
    func bake()
    func cut()
    func box()
}
//Concrete Pizzas:-----------------------------
class CheesePizza: Pizza {
    func prepare() {
        print("Preparing CheesePizza pizza")
    }

    func bake() {
        print("Baking CheesePizza pizza")
    }

    func cut() {
        print("Cutting CheesePizza pizza")
    }

    func box() {
        print("Packaging CheesePizza pizza")
    }
}

class GreekPizza: Pizza {
   func prepare() {
        print("Preparing greekPizza pizza")
    }

    func bake() {
        print("Baking greekPizza pizza")
    }

    func cut() {
        print("Cutting greekPizza pizza")
    }

    func box() {
        print("Packaging greekPizza pizza")
    } 
}

class PepperoniPizza: Pizza {
    func prepare() {
        print("Preparing PepperoniPizza pizza")
    }

    func bake() {
        print("Baking PepperoniPizza pizza")
    }

    func cut() {
        print("Cutting PepperoniPizza pizza")
    }

    func box() {
        print("Packaging PepperoniPizza pizza")
    }
}
//Pizza End:------------------------------------

//Pizza Factory: -------------------------------
class PizzaFactory {
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
//End of factory:-------------------------------

//Now use that factory to any place where you need a pizza to make.
func orderPizza(type: PizzaType) -> Pizza{
    let factory = PizzaFactory()
    let pizza = factory.makePizza(type: type)
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    return pizza
}
print("\nI want Cheese Pizza:")
let cheesePizza = orderPizza(type: .cheesePizza)
print("Here is your Pizza: \(cheesePizza)")

print("\nI want Greek Pizza:")
let greekPizza = orderPizza(type: .greekPizza)
print("Here is your Pizza: \(greekPizza)")
