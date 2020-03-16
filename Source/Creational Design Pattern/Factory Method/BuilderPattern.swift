class Car {
    private var numberOfSeats = 0
    private var engineConfig = ""
    private var gps = ""
    func setSeats(seats: Int) {
        numberOfSeats = seats
    }
    func setEngine(config: String) {
        engineConfig = config
    }
    func setGPS(gps: String) {
        self.gps = gps
    }
    func getSeats() -> Int {
        return numberOfSeats
    }
    func getConfig() -> String {
        return engineConfig
    }
    func getGPS() -> String {
        return gps
    }

    func toString() {
        print("Seat Number: \(numberOfSeats)\nEngine: \(engineConfig)\nGPS: \(gps)")
        
    }
}
class CarManual {
    private var manual = ""

    func setManual(manual: String) {
        self.manual = manual
    }
    func getManual() -> String{
        return manual
    }
}

protocol Builder {
    func reset()
    func setSeats(seats: Int)
    func setEngine(config: String)
    func setGPS(gps: String)
}

class CarBuilder: Builder {
    private var car = Car()

    init() { reset() }

    func reset() {
        car = Car()
    }
    func setSeats(seats: Int) {
        car.setSeats(seats: seats)
    }
    func setEngine(config: String) {
        car.setEngine(config: config)
    }
    func setGPS(gps: String) {
        car.setGPS(gps: gps)
    }
    func getCar() -> Car{
        return car
    }  
}

class Director {
    private var builder: Builder

    init(builder: Builder) {
        self.builder = builder
    }
    func buildSimpleCar() {
        builder.setSeats(seats: 4)
    }
    func buildFullFeaturedCar() {
        builder.setSeats(seats: 10)
        builder.setEngine(config: "120 cc Engine")
        builder.setGPS(gps: "Lat: 44.33   Long: 22.33")
    }
}

//Client

let builder = CarBuilder()
let director = Director(builder: builder)
var car: Car

print("Here is your simple Car")
director.buildSimpleCar()
car = builder.getCar()
car.toString()

builder.reset()
print("\nHere is your Super CAR")
director.buildFullFeaturedCar()
car = builder.getCar()
car.toString()