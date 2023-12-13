//
//  BikeGearModel.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import Foundation

struct BikeGearModel : Hashable, Codable {
    // default GearModel fields
    var id: Int
    var name: String
    var manufacturer: String
    var model : String
    var year : String
    var mileage : Float
//    var dateAdded : Date
//    var description : String
//    
//    var wheelSize: String
//    var frameSize : String
//    var pedals : String
//    var crankArms : String
//    var handleBars : String
//    var brakes : String
//    var shifters : String
//    var mileage : Double
}
