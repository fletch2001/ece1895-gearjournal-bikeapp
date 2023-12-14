//
//  BikeGarageView.swift
//  Gear Locker
//
//  Created by Noah Lichstein on 12/12/23.
//

import SwiftUI

struct BikeGarageView: View {
    private let foreGroundColor = Color(red: 90/255, green: 72/255, blue: 30 / 255)
    @Binding var bikeGarage: [BikeGearModel]
    @State private var editingBike = BikeGearModel.emptyBike
    @State private var originalBike: BikeGearModel?
    @State private var showEditingSheet = false
    @State private var newBikeSheet = false
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
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
                                }
                                
                            }
                    }
                    
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

