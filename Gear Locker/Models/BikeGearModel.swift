//
//  BikeGearModel.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import Foundation

struct BikeGearModel : Identifiable, Hashable, Codable {
    // default GearModel fields
    var id: UUID
    var name: String
    var manufacturer: String
    var model : String
    var year : String
    var mileage : Float
    var stravaID : String?
    
    init(id: UUID = UUID(), name: String, manufacturer: String, model: String, year: String, mileage: Float) {
        self.id = id
        self.name = name
        self.manufacturer = manufacturer
        self.model = model
        self.year = year
        self.mileage = mileage
    }
    
    init(id: UUID = UUID(), name: String, manufacturer: String, model: String, year: String, mileage: Float, stravaID: String) {
        self.id = id
        self.name = name
        self.manufacturer = manufacturer
        self.model = model
        self.year = year
        self.mileage = mileage
        self.stravaID = stravaID
    }
    
}

extension BikeGearModel {
    static var emptyBike: BikeGearModel {
        BikeGearModel(name: "", manufacturer: "", model: "", year: "", mileage: 0)
    }
}

extension BikeGearModel {
    static let sampleBikes: [BikeGearModel] =
    [BikeGearModel(name: "blue bandit 2.0", manufacturer: "Fuji", model: "Sportif 1.5", year: "2015", mileage: 1043.5, stravaID: "1"),
     BikeGearModel(name: "fixie", manufacturer: "Schwinn", model: "", year: "1995", mileage: 657.4, stravaID: "2"),
     BikeGearModel(name: "adventure machine", manufacturer: "Specialized", model: "Crux", year: "2016", mileage: 400.5, stravaID: "3"),
      BikeGearModel(name: "rock rumbler", manufacturer: "Specialized", model: "Stumpjumper", year: "1988", mileage: 233.6)
    ]
}
