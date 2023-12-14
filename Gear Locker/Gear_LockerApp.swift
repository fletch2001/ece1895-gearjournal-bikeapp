//
//  Gear_LockerApp.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/4/23.
//

import SwiftUI
import SwiftData

@main
struct Gear_LockerApp: App {
    @StateObject private var bikeStore = BikeStore()
    
    var body: some Scene {
        WindowGroup {
            //GearLockerHomePageView(bikeGarage: $bikeStore.bikes) {
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
