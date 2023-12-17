//
//  Gear_LockerApp.swift
//

import SwiftUI
import SwiftData

// put your strava OAuth access token here.
let strava_acces_token = ""

@main
struct Gear_LockerApp: App {
    @StateObject private var bikeStore = BikeStore()
    
    var body: some Scene {
        WindowGroup {
            BikeGarageView(bikeGarage: $bikeStore.bikes) {
                Task {
                    do {
                        try await bikeStore.save(bikes: bikeStore.bikes)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await bikeStore.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
