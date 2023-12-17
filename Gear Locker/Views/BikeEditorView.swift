//
//  BikeEditorView.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/13/23.
//

import SwiftUI

struct BikeEditorView: View {
    @Binding var bike: BikeGearModel
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Bike name", text: $bike.name)
                TextField("Year", text: $bike.year)
                TextField("Manufacturer", text: $bike.manufacturer)
                TextField("Model", text: $bike.model)
                Section("Mileage") {
                    TextField("Mileage", value: $bike.mileage, format: .number)
                }
            }
        }
    }
}

#Preview {
    BikeEditorView(bike: .constant(BikeGearModel.sampleBikes[0]))
}
