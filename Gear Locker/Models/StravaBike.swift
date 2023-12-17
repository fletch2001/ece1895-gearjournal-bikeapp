//
//  StravaGear.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/15/23.
//

import Foundation

struct StravaBike: Identifiable, Codable {
    var id: String { stravaId }
    
    var stravaId : String
    var mileage : Float
    var manufacturer : String
    var model : String
    var name : String
//}

//extension StravaBike : Identifiable {
//    var id: String { stravaId }
//}

//extension StravaBike : Decodable {
    private enum CodingKeys: String, CodingKey {
        case stravaId = "id"
        case mileage = "converted_distance"
        case manufacturer = "brand_name"
        case model = "model_name"
        case name = "name"
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? values.decode(String.self, forKey: .stravaId)
        let rawManufacturer = try? values.decode(String.self, forKey: .manufacturer)
        let rawModel = try? values.decode(String.self, forKey: .model)
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawMileage = try? values.decode(Float.self, forKey: .mileage)
        
        guard let id = rawId,
              let model = rawModel,
              let name = rawName,
              let mileage = rawMileage,
              let manufacturer = rawManufacturer
        else {
            throw BikeError.missingData
        }
        
        self.stravaId = id
        self.model = model
        self.name = name
        self.mileage = mileage
        self.manufacturer = manufacturer
    }
}
