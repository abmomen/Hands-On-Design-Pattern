enum PizzaType {
    case cheesePizza, greekPizza, pepperoni
}
protocol Pizza {
    func prepare()
    func bake()
    func cut()
    func box()
}

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

protocol PizzaFactory {
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

let factory = MainFactory()
let pizza = factory.makePizza(type: .cheesePizza)
pizza.prepare()
pizza.bake()
pizza.cut()
pizza.box()

print("Your Pizza is ready to be delivered")
