//
//  BikeGarageView.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import SwiftUI

struct BikeGarageView: View {
    private let foreGroundColor = Color(red: 90/255, green: 72/255, blue: 30 / 255)
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(bikes, id: \.id) {
                    bicycle in BikeTileView(bike: bicycle)
                }
            }
            .navigationTitle("Bike Garage")
        }
        
    }
}

#Preview {
    BikeGarageView()
}
