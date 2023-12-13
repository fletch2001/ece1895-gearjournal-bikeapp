//
//  GearModel.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import Foundation

class GearModel : Codable {
    static func == (lhs: GearModel, rhs: GearModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var manufacturer: String
    var dateAdded : Date
    var description : String
}
