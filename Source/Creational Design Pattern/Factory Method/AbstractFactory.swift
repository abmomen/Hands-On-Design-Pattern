protocol Chair {
    func hasLegs()
    func sitOn()
}

class VictorianChair: Chair {
    func hasLegs() {
        print("Victorian chairs has four legs")
    }
    func sitOn() {
        print("You can sit on Victorian chair")
    }
}

class ModernChair: Chair {
    func hasLegs() {
        print("Modern chairs has four legs")
    }
    func sitOn() {
        print("You can sit on Modern chair")
    }
}


protocol Sofa {
    func hasLegs()
    func layOn()
}

class VictorianSofa: Sofa {
    func hasLegs() {
        print("Victorian sofas have 6 legs")
    }
    func layOn() {
        print("Victorian sofas are comfortable to lay on")
    }
}

class ModernSofa: Sofa {
  func hasLegs() {
        print("Victorian sofas have 4 legs")
    }
    func layOn() {
        print("Victorian sofas are more comfortable to lay on than victorian")
    }  
}

enum FurnitureType {
    case victorian, modern
}
protocol FurnitureFactory {
    func makeChair() -> Chair
    func makeSofa() -> Sofa
}

class VictorianFurnitureFactory: FurnitureFactory {
    func makeChair() -> Sofa{
        return VictorianChair()
    }
    func makeSofa() -> Sofa {
        return VictorianSofa()
    }
}

class ModernFurnitureFactory: FurnitureFactory {
    func makeChair() -> Sofa{
        return ModernChair()
    }
    func makeSofa() -> Sofa {
        return ModernSofa()
    }
}

class Client{
    let furnitureType: FurnitureType
    var factory: FurnitureFactory
    init(furnitureType: FurnitureType) {
        self.factory = factory
    }
    switch furnitureType {
    case .victorian:
        factory = VictorianFurnitureFactory()
    case .modern:
        factory = ModernFurnitureFactory()
    }

    func getChair() -> Chair {
        print("Here is your Chair: \(factory.makeChair())")
    }
    func getSofa() {
        print("Here is your Sofa: \(factory.makeSofa())")
    }
}

//Test: 
let client = Client(furnitureType: .victorian)
print(client.getChair())
print(client.getSofa())

