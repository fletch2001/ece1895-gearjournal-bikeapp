//
//  BikeGarageView.swift
//

import SwiftUI
import Foundation

@MainActor class PostStravaBikes : ObservableObject {
    @Published var bikesFromStrava = [StravaBike] ()
    
    let decoder = JSONDecoder()
    
    func fetchBikes() async throws{
        bikesFromStrava.removeAll()
        
        let (athlete_data, response) = try await URLSession.shared.data(from: URL(string: "https://strava.com/api/v3/athlete?access_token=\(strava_acces_token)")!)
        
        var bike_ids: [String] = []
        
        let athlete = try decoder.decode(StravaAthlete.self, from: athlete_data)
        
        for id in athlete.bike_ids {
            bike_ids.append(id)
        }
        
        for bike in bike_ids {
            
            let (data, response) = try await URLSession.shared.data(from: URL(string: "https://strava.com/api/v3/gear/\(bike)?access_token=\(strava_acces_token)")!)
            
            //            guard let data: Data = await WebService().downloadData(fromURL: "https://strava.com/api/v3/gear/\(bike)?access_token=\(strava_acces_token)")
            //            else {return}
            
            bikesFromStrava.append(try decoder.decode(StravaBike.self, from: data))
        }
        
        
    }
}

struct BikeGarageView: View {
    private let foreGroundColor = Color(red: 90/255, green: 72/255, blue: 30 / 255)
    @Binding var bikeGarage: [BikeGearModel]
    @State private var editingBike = BikeGearModel.emptyBike
    @State private var originalBike: BikeGearModel?
    @State private var showEditingSheet = false
    @State private var newBikeSheet = false
    
    @StateObject var stravaClient = PostStravaBikes()
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        if(stravaClient.bikesFromStrava.count > 0) {
                            ForEach(stravaClient.bikesFromStrava, id: \.id) {bicycle in
                                StravaBikeTileView(bike: bicycle)
                            }
                        }
                        ForEach($bikeGarage, id: \.id) { $bicycle in
                            BikeTileView(bike: $bicycle)
                                .onTapGesture{
                                    editingBike = bicycle
                                    showEditingSheet = true
                                }
                                .sheet(isPresented: $showEditingSheet) {
                                    NavigationStack {
                                        BikeEditorView(bike: $editingBike)
                                            .navigationTitle(editingBike.name)
                                            .toolbar {
                                                ToolbarItem(placement: .cancellationAction) {
                                                    Button("Cancel") {
                                                        showEditingSheet = false
                                                    }
                                                }
                                                ToolbarItem(placement: .confirmationAction) {
                                                    Button("Done") {
                                                        showEditingSheet = false
                                                        bicycle = editingBike
                                                    }
                                                }
                                            }
                                        Button(action: {bikeGarage.remove(at:bikeGarage.firstIndex(of: bicycle)!)
                                            showEditingSheet = false
                                        }, label: { Text("Delete").foregroundStyle(Color(.red))
                                        })
                                    }
                                    
                                }
                                .onChange(of: scenePhase) { phase in
                                    if phase == .inactive { saveAction() }
                                }
                        }
                        
                    }
                    .refreshable {
                        Task {
                            try await stravaClient.fetchBikes()
                        }
                    }
                    .onAppear {
                        Task {
                            try await stravaClient.fetchBikes()
                        }
                    }
                    //                    Text("Last updated \(stravaUpdateTime)")
                }
                .navigationTitle("Bike Garage")
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image(systemName: "plus")
                            .resizable()
                            .padding(6)
                            .frame(width: 45, height: 45)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .onTapGesture{
                                newBikeSheet = true
                                editingBike = BikeGearModel.emptyBike
                            }
                            .sheet(isPresented: $newBikeSheet) {
                                NavigationStack {
                                    BikeEditorView(bike: $editingBike)
                                        .navigationTitle("Add New Bike")
                                        .toolbar {
                                            ToolbarItem(placement: .cancellationAction) {
                                                Button("Cancel") {
                                                    newBikeSheet = false
                                                }
                                            }
                                            ToolbarItem(placement: .confirmationAction) {
                                                Button("Done") {
                                                    newBikeSheet = false
                                                    bikeGarage.append(editingBike)
                                                }
                                            }
                                        }
                                }
                            }
                            .onChange(of: scenePhase) { phase in
                                if phase == .inactive { saveAction() }
                            }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    BikeGarageView(bikeGarage: .constant(BikeGearModel.sampleBikes), saveAction: {})
}

