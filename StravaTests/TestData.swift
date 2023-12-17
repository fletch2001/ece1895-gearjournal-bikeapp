//
//  TestData.swift
//  StravaTests
//

import Foundation

let testFeature_stravaBikeGet: Data = """
{
  "id" : "b1231",
  "primary" : false,
  "resource_state" : 3,
  "distance" : 388206,
  "brand_name" : "BMC",
  "model_name" : "Teammachine",
  "frame_type" : 3,
  "description" : "My Bike.",
  "name" : "Strava Bike",
  "converted_distance": 122332
}
""".data(using: .utf8)!

let testFeature_stravaAccessToken: Data = """
    {
      "token_type": "Bearer",
      "expires_at": 1568775134,
      "expires_in": 21600,
      "refresh_token": "e5n567567...",
      "access_token": "a4b945687g...",
      "athlete": {
        "id": 12321431
      }
    }
""".data(using: .utf8)!

let testFeature_athlete: Data = """
{
  "id" : 1234567890987654321,
  "username" : "marianne_t",
  "resource_state" : 3,
  "firstname" : "Marianne",
  "lastname" : "Teutenberg",
  "city" : "San Francisco",
  "state" : "CA",
  "country" : "US",
  "sex" : "F",
  "premium" : true,
  "created_at" : "2017-11-14T02:30:05Z",
  "updated_at" : "2018-02-06T19:32:20Z",
  "badge_type_id" : 4,
  "profile_medium" : "https://xxxxxx.cloudfront.net/pictures/athletes/123456789/123456789/2/medium.jpg",
  "profile" : "https://xxxxx.cloudfront.net/pictures/athletes/123456789/123456789/2/large.jpg",
  "friend" : null,
  "follower" : null,
  "follower_count" : 5,
  "friend_count" : 5,
  "mutual_friend_count" : 0,
  "athlete_type" : 1,
  "date_preference" : "%m/%d/%Y",
  "measurement_preference" : "feet",
  "clubs" : [ ],
  "ftp" : null,
  "weight" : 0,
  "bikes" : [ {
    "id" : "b12345678987655",
    "primary" : true,
    "name" : "EMC",
    "resource_state" : 2,
    "distance" : 0
  } ],
  "shoes" : [ {
    "id" : "g12345678987655",
    "primary" : true,
    "name" : "adidas",
    "resource_state" : 2,
    "distance" : 4904
  } ]
}
""".data(using: .utf8)!
