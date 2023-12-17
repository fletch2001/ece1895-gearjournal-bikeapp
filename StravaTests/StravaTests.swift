//
//  StravaTests.swift
//  StravaTests
//

import XCTest
@testable import Gear_Locker

class StravaTests: XCTestCase    {
    func testBikeJSONDecoderDecodesStravaGearDump() throws {
        let decoder = JSONDecoder()
        let bike = try decoder.decode(StravaBike.self, from: testFeature_stravaBikeGet)
        
        XCTAssertEqual(bike.manufacturer, "BMC")
        XCTAssertEqual(bike.model, "Teammachine")
        XCTAssertEqual(bike.name, "Strava Bike")
    }
    
    func testStravaOAuthDecoding() throws {
        let decoder = JSONDecoder()
        let oauth_dump = try decoder.decode(StravaOAuthTokenJSON.self, from: testFeature_stravaAccessToken)
        
        XCTAssertEqual(oauth_dump.access_token, "a4b945687g...")
        XCTAssertEqual(oauth_dump.athleteId, 12321431)
        XCTAssertEqual(oauth_dump.access_token_expiration, 1568775134)
    }
    
    func testStravaAthleteDecoding() throws {
        let decoder = JSONDecoder()
        
        let athlete = try decoder.decode(StravaAthlete.self, from: testFeature_athlete)
        
        XCTAssertEqual(athlete.bike_ids[0], "b12345678987655")
        XCTAssertEqual(athlete.bike_ids.count, 1)
    }
}
