//
//  StravaOAuthTokenJSON.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/15/23.
//

import Foundation

struct StravaOAuthTokenJSON: Decodable {
    let athleteId: Int
    let access_token: String
    let access_token_expiration: Int
    
    private enum RootCodingKeys: String, CodingKey {
        case access_token
        case expires_at
        case athlete
    }
    
    private enum AthleteCodingKeys: String, CodingKey {
        case athleteId = "id"
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let athleteContainer = try rootContainer.nestedContainer(keyedBy: AthleteCodingKeys.self, forKey: .athlete)
        
        let rawAccessToken = try? rootContainer.decode(String.self, forKey: .access_token)
        let rawAccessTokenExpiration = try? rootContainer.decode(Int.self, forKey: .expires_at)
        
        let rawAthleteId = try? athleteContainer.decode(Int.self, forKey: .athleteId)
        
        
        
        guard let accessToken = rawAccessToken,
              let access_token_expiration = rawAccessTokenExpiration
        else {
            throw StravaOAuthError.missingData
        }
        
        
        guard let athleteId = rawAthleteId
        else {
            throw StravaOAuthError.athleteIdDecodeError
        }
        
        self.athleteId = athleteId
        self.access_token = accessToken
        self.access_token_expiration = access_token_expiration
    }
}

enum StravaOAuthError: Error {
    case athleteIdDecodeError
    case missingData
}

extension StravaOAuthError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .athleteIdDecodeError:
            return NSLocalizedString("could not decode athlete id", comment: "")
        case .missingData:
            return NSLocalizedString("Missing data on strava oauth try", comment: "")
        }
    }
}
