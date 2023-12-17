//
//  GearStore.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/13/23.
//

import Foundation

class BikeStore: ObservableObject {
    @Published var bikes: [BikeGearModel] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("bikes.data")
    }
    
    func load() async throws {
        let task = Task<[BikeGearModel], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let bicycles = try JSONDecoder().decode([BikeGearModel].self, from: data)
            return bicycles
        }
        let bikes = try await task.value
        self.bikes = bikes
    }
    
    func save(bikes: [BikeGearModel]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(bikes)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
