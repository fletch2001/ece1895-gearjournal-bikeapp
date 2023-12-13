//
//  LoadData.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import Foundation

var bikes: [BikeGearModel] = [BikeGearModel(id: 1, name: "blue bandit 2.0", manufacturer: "Fuji", model: "Sportif 1.5", year: "2015", mileage: 1043.5),
                              BikeGearModel(id: 2, name: "fixie", manufacturer: "Schwinn", model: "", year: "1995", mileage: 657.4),
                              BikeGearModel(id: 3, name: "adventure machine", manufacturer: "Specialized", model: "Crux", year: "2016", mileage: 400.5),
                              BikeGearModel(id: 4, name: "rock rumbler", manufacturer: "Specialized", model: "Stumpjumper", year: "1988", mileage: 233.6)
]

// from https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
