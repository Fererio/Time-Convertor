//
//  ContentView.swift
//  Time Convertor
//
//  Created by Balaji Srinivas on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    
    let unit = ["Seconds", "Minutes", "Hours", "Days"]
    
    @State private var selectedInputUnit = "Days"
    @State private var time = 0
    @State private var selectedOutputUnit = "Seconds"
    
    var outputTime: Int {
        // Calculation of the output
        var outputTimeInSec = 0
        switch selectedInputUnit {
        case "Minutes":
            outputTimeInSec = time * 60
        case "Hours":
            outputTimeInSec = time * 60 * 60
        case "Days":
            outputTimeInSec = time * 60 * 60 * 24
        default:
            outputTimeInSec = time
        }
        
        var actualOutputTime = 0
        
        switch selectedOutputUnit {
        case "Minutes":
            actualOutputTime = outputTimeInSec / 60
        case "Hours":
            actualOutputTime = (outputTimeInSec / 60) / 60
        case "Days":
            actualOutputTime = ((outputTimeInSec / 60) / 60) / 24
        default:
            actualOutputTime = outputTimeInSec
        }
        return actualOutputTime
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextField("Enter the time", value: $time, format: .number)
                } header: {
                    Text("Enter the input value")
                }
                
                Section {
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(unit, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text("\(outputTime)")
                }
            }
            .navigationTitle("TIME CONVERTOR")
        }
    }
}

#Preview {
    ContentView()
}
