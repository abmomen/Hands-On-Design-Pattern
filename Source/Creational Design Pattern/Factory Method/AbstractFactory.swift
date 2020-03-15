//lets we have some devices
enum DeviceType {
    case HP, Dell, Samsung, OnePlus
}
//Abstract Device
protocol Device {
    func getConfig()
}

//MARK: Concrete devices...............................................................Start
class HP: Device {
    let ram: String
    let processor: String
    let gpu: String

    init(ram: String, processor: String, gpu: String) {
        self.ram = ram
        self.processor = processor
        self.gpu = gpu
    }

    func getConfig() {
        print("HP Laptop Config: RAM: \(ram) Processor: \(processor) GPU: \(gpu)")
    }
}

class Dell: Device {
    let ram: String
    let processor: String
    let gpu: String

    init(ram: String, processor: String, gpu: String) {
        self.ram = ram
        self.processor = processor
        self.gpu = gpu
    }

    func getConfig() {
        print("Dell Laptop Config: RAM: \(ram) Processor: \(processor) GPU: \(gpu)")
    }
}

class Samsung: Device {
    let ram: String
    let processor: String

    init(ram: String, processor: String) {
        self.ram = ram
        self.processor = processor
    }

    func getConfig() {
        print("Samsung Mobile Config: RAM: \(ram) Processor: \(processor)")
    }
}

class OnePlus: Device {
    let ram: String
    let processor: String

    init(ram: String, processor: String) {
        self.ram = ram
        self.processor = processor
    }

    func getConfig() {
        print("OnePlus Mobile Config: RAM: \(ram) Processor: \(processor)")
    }
}

//Concrete devices...............................................................End

//MARK: Abstract Factory
enum FactoryTypes {
    case ComputerFactory, MobileFactory
}
protocol DeviceFactory {
    func createDevice(deviceType: DeviceType) -> Device?
}

//MARK: Concrete Factories......................................................Start
class ComputerFactory: DeviceFactory {
    func createDevice(deviceType: DeviceType) -> Device? {
        switch deviceType {
        case .HP:
            return HP(ram: "8 GB", processor: "core i7", gpu: "4 GB")
        case .Dell:
            return Dell(ram: "16 GB", processor: "core i5", gpu: "2 GB")
        default: 
            return nil
        }
        
    }
}

class MobileFactory: DeviceFactory {
    func createDevice(deviceType: DeviceType) -> Device? {
        switch deviceType {
        case .OnePlus:
            return OnePlus(ram: "4 GB", processor: "Qualcom Snap Dragon 865")
        case .Samsung:
            return Samsung(ram: "3 GB", processor: "Exynos 9611")
        default:
            return nil
        }
    }
}
//Factories.......................................................................End

// MARK: Factory Generator
class FactoryGeneratory {
    static func getFactory(factoryType: FactoryTypes) -> DeviceFactory {
        switch factoryType {
        case .ComputerFactory:
            return ComputerFactory()
        case .MobileFactory:
            return MobileFactory()
        }
    }
}

//MARK: Test Client: 
let factory = FactoryGeneratory.getFactory(factoryType: .MobileFactory)
if let samsung = factory.createDevice(deviceType: .Samsung) {
    samsung.getConfig()
}

if let onePlus = factory.createDevice(deviceType: .OnePlus) {
    onePlus.getConfig()
}


