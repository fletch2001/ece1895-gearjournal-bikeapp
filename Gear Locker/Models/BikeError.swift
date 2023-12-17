//
//  BikeError.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/15/23.
//

import Foundation

enum BikeError: Error {
    case missingData
}

extension BikeError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Missing data on strava get", comment: "")
        }
    }
}
