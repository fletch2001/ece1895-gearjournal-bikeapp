//
//  BikeTileView.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import SwiftUI

let stravaOrange = Color(red: 228 / 255, green : 91 / 255, blue: 41 / 255)

struct BikeTileView: View {
    private let foreGroundColor = Color(red: 90/255, green: 72/255, blue: 30 / 255)
    
    let bike: BikeGearModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                // icon here
                Text(bike.name)
                    .font(.title)
                Text("\(bike.year) \(bike.manufacturer) \(bike.model)")
                // connected to strava status
                Text("Not Connected to Strava")
                    .foregroundStyle(.white)
                    .background(Rectangle().fill(stravaOrange))
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    .shadow(radius: 2)
                    .padding(0.1)
            }
            Spacer()
            VStack{
                Text("\(bike.mileage, specifier: "%.1f")")
                    .font(.system(size: 35))
                    .padding(.bottom, -15)
                Text("miles")
            }
        }
        .padding()
        .background{
            Rectangle()
                .opacity(0.3)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding([.leading, .trailing])
    }
}

var testBike: BikeGearModel = BikeGearModel(id: 1, name: "rock rumbler", manufacturer: "Specialized", model: "Stumpjumper", year: "1988", mileage: 1234.5)

#Preview {
    
//    testBike.id = 1
//    testBike.name = "test bike 1"
    BikeTileView(bike: testBike)
    //BikeTileView()
}
