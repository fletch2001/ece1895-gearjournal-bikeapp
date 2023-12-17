//
//  StravaAthlete.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/16/23.
//

import Foundation

struct StravaAthlete: Decodable {
    let bike_ids: [String]
    
    private enum RootCodingKeys: String, CodingKey {
        case bikes
    }
    
    private enum BikeCodingKeys: String, CodingKey {
        case id
    }
    
    private(set) var bikes: [String] = []
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
       
        var bikeContainer = try rootContainer.nestedUnkeyedContainer(forKey: .bikes)
        
        while !bikeContainer.isAtEnd {
            let nestedBikeContainer = try bikeContainer.nestedContainer(keyedBy: BikeCodingKeys.self)
            
            if let rawId = try? nestedBikeContainer.decode(String.self, forKey: .id) {
                bikes.append(rawId)
            }
        }
        self.bike_ids = bikes
    }
}

enum StravaAthleteError: Error {
    case missingData
}

extension StravaAthleteError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Missing data on strava athlete bike id try", comment: "")
        }
    }
}

