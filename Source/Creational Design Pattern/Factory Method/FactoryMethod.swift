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
//MARK: Local Pizzas 
class LocalCheesePizza: Pizza {
    func prepare() {
        print("Preparing LocalCheesePizza pizza")
    }

    func bake() {
        print("Baking LocalCheesePizza pizza")
    }

    func cut() {
        print("Cutting LocalCheesePizza pizza")
    }

    func box() {
        print("Packaging LocalCheesePizza pizza")
    }
}

class LocalGreekPizza: Pizza {
   func prepare() {
        print("Preparing LocalgreekPizza pizza")
    }

    func bake() {
        print("Baking LocalgreekPizza pizza")
    }

    func cut() {
        print("Cutting LocalgreekPizza pizza")
    }

    func box() {
        print("Packaging LocalgreekPizza pizza")
    } 
}

class LocalPepperoniPizza: Pizza {
    func prepare() {
        print("Preparing LocalPepperoniPizza pizza")
    }

    func bake() {
        print("Baking LocalPepperoniPizza pizza")
    }

    func cut() {
        print("Cutting LocalPepperoniPizza pizza")
    }

    func box() {
        print("Packaging LocalPepperoniPizza pizza")
    }
}

//MARK: Remote Pizzas

class RemoteCheesePizza: Pizza {
    func prepare() {
        print("Preparing RemoteCheesePizza pizza")
    }

    func bake() {
        print("Baking RemoteCheesePizza pizza")
    }

    func cut() {
        print("Cutting RemoteCheesePizza pizza")
    }

    func box() {
        print("Packaging RemoteCheesePizza pizza")
    }
}

class RemoteGreekPizza: Pizza {
   func prepare() {
        print("Preparing RemotegreekPizza pizza")
    }

    func bake() {
        print("Baking RemotegreekPizza pizza")
    }

    func cut() {
        print("Cutting RemotegreekPizza pizza")
    }

    func box() {
        print("Packaging RemotegreekPizza pizza")
    } 
}

class RemotePepperoniPizza: Pizza {
    func prepare() {
        print("Preparing RemotePepperoniPizza pizza")
    }

    func bake() {
        print("Baking RemotePepperoniPizza pizza")
    }

    func cut() {
        print("Cutting RemotePepperoniPizza pizza")
    }

    func box() {
        print("Packaging RemotePepperoniPizza pizza")
    }
}
//Pizza End:------------------------------------
protocol PizzaFactory {
    func makePizza(type: PizzaType) -> Pizza 
}
//Pizza Factory: -------------------------------
class LocalPizzaFactory: PizzaFactory {
    func makePizza(type: PizzaType) -> Pizza {
       switch type {
        case .cheesePizza:
            return LocalCheesePizza()
        case .greekPizza:
            return LocalGreekPizza()
        case .pepperoni:
            return LocalPepperoniPizza()
        } 
    }
}

class RemotePizzaFactory: PizzaFactory {
    func makePizza(type: PizzaType) -> Pizza {
       switch type {
        case .cheesePizza:
            return RemoteCheesePizza()
        case .greekPizza:
            return RemoteGreekPizza()
        case .pepperoni:
            return RemotePepperoniPizza()
        } 
    }
}
//End of factory:-------------------------------
enum PizzaFlavour {
    case local, remote
}
//Now use that factory to any place where you need a pizza to make.
func orderPizza(type: PizzaType, flavour: PizzaFlavour) -> Pizza{
    switch flavour {
    case .local:
        let factory = LocalPizzaFactory()
        let pizza = factory.makePizza(type: type)
        pizza.prepare()
        pizza.bake()
        pizza.cut()
        pizza.box()
    return pizza 
    case .remote:
        let factory = RemotePizzaFactory()
    let pizza = factory.makePizza(type: type)
    pizza.prepare()
    pizza.bake()
    pizza.cut()
    pizza.box()
    return pizza
    }
    
}
print("\nI want Local Cheese Pizza:")
let localCheesePizza = orderPizza(type: .cheesePizza, flavour: .local)
print("Here is your Pizza: \(localCheesePizza)")

print("\nI want Remote Greek Pizza:")
let remoteGreekPizza = orderPizza(type: .greekPizza, flavour: .remote)
print("Here is your Pizza: \(remoteGreekPizza)")
