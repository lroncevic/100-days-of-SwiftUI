//
//  ContentView.swift
//  Challenge1_ConversionsApp
//
//  Created by Luka Rončević on 18.01.2024..
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var inputNumber = 0.0
    @FocusState private var valueIsFocused: Bool
    
    let units = ["Meter", "Kilometer", "Foot", "Yard", "Miles"]
    
    var outputValue: Double {
        var inputValue = 0.0
        var outputValue = 0.0
        
        if inputUnit == "Meter" {
            inputValue = inputNumber
        }
        else if inputUnit == "Kilometer" {
            inputValue = inputNumber * 1000
        }
        else if inputUnit == "Foot" {
            inputValue = inputNumber * 0.3048
        }
        else if inputUnit == "Yard" {
            inputValue = inputNumber * 0.9144
        }
        else if inputUnit == "Miles" {
            inputValue = inputNumber * 1609.344
        }
        
        if outputUnit == "Meter" {
            outputValue = inputValue
        }
        else if outputUnit == "Kilometer" {
            outputValue = inputValue / 1000
        }
        else if outputUnit == "Foot" {
            outputValue = inputValue / 0.3048
        }
        else if outputUnit == "Yard" {
            outputValue = inputValue / 0.9144
        }
        else if outputUnit == "Miles" {
            outputValue = inputValue * 0.000621371
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Type value here") {
                    TextField("Value", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                }
                
                Section("Input unit") {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Ouput unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text(outputValue, format: .number  )
                }
                
            }
            .navigationTitle("ConversionsApp")
            .toolbar {
                if valueIsFocused {
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
