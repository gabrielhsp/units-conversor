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
    @State private var temperatureUnit: String = "Celsius"
    private let temperatureUnits: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    
    // MARK: - Computed Properties
    var body: some View {
        Form {
            Section {
                TextField("Temperature", value: $temperature, format: .number)
                    .keyboardType(.numberPad)
            } header : {
                Text("Temperature to convert:")
            }
            
            Section {
                Picker("Temperature Unit", selection: $temperatureUnit) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            } header : {
                Text("What's the conversion unit?")
            }
            
            Section {
                Text(temperature, format: .number)
            } header : {
                Text("Temperature in \(temperatureUnit) is:")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
