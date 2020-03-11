enum Brand {
    case apple, dell, hp
}
protocol Computer {
    func performMath()
}

class Dell: Computer {
    func performMath() {
        print("Dell Performs math")
    }
}

class Apple: Computer {
    func performMath() {
        print("Apple Performs math")
    } 
}

class HP: Computer {
    func performMath() {
        print("HP Performs math")
    }
}

protocol Factory {
    func makeComputer(brandName: Brand) -> Computer
}
class ComputerFactory: Factory {
    func makeComputer(brandName: Brand) -> Computer {
        switch brandName {
        case .apple:
            return Apple()
        case .dell:
            return Dell()
        case .hp:
            return HP()
        }
    }
}

let factory = ComputerFactory()
let myComputer = factory.makeComputer(brandName: .apple)
myComputer.performMath()
myComputer.editPhoto()