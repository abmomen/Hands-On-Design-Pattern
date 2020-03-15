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
    func makeChair() -> Chair{
        return VictorianChair()
    }
    func makeSofa() -> Sofa {
        return VictorianSofa()
    }
}

class ModernFurnitureFactory: FurnitureFactory {
    func makeChair() -> Chair{
        return ModernChair()
    }
    func makeSofa() -> Sofa {
        return ModernSofa()
    }
}

class FurnitureShop {
    var factory: FurnitureFactory
    init(furnitureType: FurnitureType) {
        switch furnitureType {
            case .victorian:
                self.factory = VictorianFurnitureFactory()
            case .modern:
                self.factory = ModernFurnitureFactory()
        }
    }
    
    func getChair() -> Chair{
        return factory.makeChair()
    }
    func getSofa() -> Sofa{
        return factory.makeSofa()
    }
}

//Test: 
let furnitureShop = FurnitureShop(furnitureType: .victorian)
let chair = furnitureShop.getChair()
chair.hasLegs()
chair.sitOn()

let sofa = furnitureShop.getSofa()
sofa.hasLegs()
sofa.layOn()

