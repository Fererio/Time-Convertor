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
    @State private var outputUnit = "Seconds"
    
    var outputTime: Int {
        // Calculation of the output
        
        return 10
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
                    Picker("Output Unit", selection: $outputUnit) {
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
