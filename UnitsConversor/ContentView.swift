//
//  ContentView.swift
//  UnitsConversor
//
//  Created by Gabriel Pereira on 05/02/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var temperature: Double = 20
    @State private var temperatureUnitEntrancy: UnitTemperature = .celsius
    private let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    
    // MARK: - Computed Properties
    
    var body: some View {
        Form {
            Section {
                Picker("Temperature Unit", selection: $temperatureUnitEntrancy) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0.symbol)
                    }
                }
                .pickerStyle(.segmented)
            } header : {
                Text("What's the conversion unit?")
            }
            
            Section {
                TextField("Temperature", value: $temperature, format: .number)
                    .keyboardType(.numberPad)
            } header : {
                Text("Temperature to convert:")
            }
            
            Section {
                Text("")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
