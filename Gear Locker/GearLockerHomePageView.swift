//
//  ContentView.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/6/23.
//

import SwiftUI



struct GearLockerHomePageView: View {
    @Binding var bikeGarage: [BikeGearModel]
    let saveAction: ()->Void
    var body: some View {
        //Spacer()
        TabView{
            // bike section
            BikeGarageView(bikeGarage: $bikeGarage, saveAction: {})
                .tabItem {
                    Image(systemName: "figure.outdoor.cycle")
                    //Text("🚴")
                    Text("Bike Garage")
                }
            
            Text("climbing section")
            
            .tabItem {
                //Label("Climbing Gear Rack", image: "person_climbing.png")
                //Image("person_climbing")
                Image(systemName: "figure.climbing")
                    //Text("🧗")
                Text("Climbing Gear Rack")
                    
                }
            }
                }
//        HStack {
//            Button(action:{}) {
//                VStack {
//                    Text("🚴")
//                    Text("Bike Gear")
//                }
//            }
//            Spacer()
//            Button(action:{ }) {
//                VStack {
//                    Text("🧗")
//                    Text("Climbing Gear")
//                }
//            }
//        }
//        .padding(UIScreen.main.bounds.width/6)
        //.safeAreaInset(edge: .bottom)
    }


struct GearHomePageView_Previews: PreviewProvider {
    static var previews: some View {
        GearLockerHomePageView(bikeGarage: .constant(BikeGearModel.sampleBikes), saveAction: {})
    }
}
