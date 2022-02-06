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
    @State private var temperatureUnitConversion: UnitTemperature = .celsius
    private let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    
    // MARK: - Computed Properties
    private var temperatureConverted: Measurement<UnitTemperature> {
        return Measurement(
            value: temperature,
            unit: temperatureUnitEntrancy
        ).converted(to: temperatureUnitConversion)
    }
    
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
                Text("Unit Conversion")
            }
            
            Section {
                TextField("Temperature", value: $temperature, format: .number)
                    .keyboardType(.numberPad)
            } header : {
                Text("Temperature")
            }
            
            Section {
                Picker("Temperature unit to convert", selection: $temperatureUnitConversion) {
                    ForEach(temperatureUnits, id: \.self) {
                        Text($0.symbol)
                    }
                }
                .pickerStyle(.segmented)
            } header : {
                Text("Convert temperature in \(temperatureUnitEntrancy.symbol) to:")
            }
            
            Section {
                Text(temperatureConverted.description)
            } header : {
                Text("Temperature converted")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
