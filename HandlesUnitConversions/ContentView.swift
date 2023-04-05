//
//  ContentView.swift
//  HandlesUnitConversions
//
//  Created by user236450 on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstLayout = "Meters"
    @State private var secondLayout = "Yards"
    @State private var unitFirst = 0.0
    
    var unitSecond: Double{
        let resultNumber: Double = unitFirst
        
        if firstLayout == "Meters"{
            if secondLayout == "Kilometers"{
                 return convertMetersToKilometers
            }
            else if secondLayout == "Feet"{
                return convertMetersToFeet
            }
            else if secondLayout == "Yards"{
                return convertMetersToYards
            }
            else if secondLayout == "Miles"{
                return convertMetersToMiles
            }
            else{
                return resultNumber
            }
        }
        else if firstLayout == "Kilometers"{
            if secondLayout == "Meters"{
                return convertKilometersToMeters
            }
            else if secondLayout == "Feet"{
                return convertKilometersToFeet
            }
            else if secondLayout == "Yards"{
                return convertKilometersToYards
            }
            else if secondLayout == "Miles"{
                return convertKilometersToMiles
            }
            else{
                return resultNumber
            }
        }
        else if firstLayout == "Yards"{
            if secondLayout == "Meters"{
                return convertYardsToMeters
            }
            else if secondLayout == "Feet"{
                return convertYardsToFeet
            }
            else if secondLayout == "Kilometers"{
                return convertYardsToKilometers
            }
            else if secondLayout == "Miles"{
                return convertYardsToMiles
            }
            else{
                return resultNumber
            }
        }
        else if firstLayout == "Feet"{
            if secondLayout == "Meters"{
                return convertFeetsToMeters
            }
            else if secondLayout == "Yards"{
                return convertFeetsToYards
            }
            else if secondLayout == "Kilometers"{
                return convertFeetsToKilometers
            }
            else if secondLayout == "Miles"{
                return convertFeetsToMiles
            }
            else{
                return resultNumber
            }
        }
        else if firstLayout == "Miles"{
            if secondLayout == "Meters"{
                return convertMilesToMeters
            }
            else if secondLayout == "Feet"{
                return convertMilesToFeets
            }
            else if secondLayout == "Kilometers"{
                return convertMilesToKilometers
            }
            else if secondLayout == "Yards"{
                return convertMilesToYards
            }
            else{
                return resultNumber
            }
        }
        return 0.0
    }
    
    var convertMetersToKilometers: Double {
        return unitFirst * 0.001 // in 1 meter 0.001 kilometers
    }
    
    var convertMetersToFeet: Double{
        return unitFirst * 3.28084 // in 1 meter 3.28084 feets
    }
    
    var convertMetersToYards: Double{
        return unitFirst * 1.0936 // in 1 meter 1.0936 yards
    }
    
    var convertMetersToMiles: Double{
        return unitFirst * 0.00062137 // in 1 meter 0.00062137 miles
    }
    
    var convertKilometersToMeters: Double{
        return unitFirst * 1000 // in 1 kilometr 1000 meters
        
    }
    
    var convertKilometersToFeet: Double{
        return unitFirst * 3280.84 // in 1 kilometr 3280.84 feets
    }
    
    var convertKilometersToYards: Double{
        return unitFirst * 1093.6 // in 1 kilometr 1093.6 yards
    }
    
    var convertKilometersToMiles: Double{
        return unitFirst * 0.62137 // in 1 kilometr 0.62137 miles
    }
    
    var convertFeetsToMeters: Double{
        return unitFirst * 0.3047 // in 1 feet 0.3047 meters
    }
    
    var convertFeetsToKilometers: Double{
        return unitFirst * 304.7 // in 1 feet 304.7 kilometers
    }
    
    var convertFeetsToYards: Double{
        return unitFirst * 0.3333 // in 1 feet 0.333 yards
    }
    
    var convertFeetsToMiles: Double{
        return unitFirst * 0.000189394 // in 1 feet 0,000189394 miles
    }
    
    var convertYardsToMeters: Double{
        return unitFirst * 0.9144 // in 1 yard 0.9144 meters
    }
    
    var convertYardsToKilometers: Double{
        return unitFirst * 914.4 // in 1 yard 914.4 kilometers
    }
    
    var convertYardsToFeet: Double{
        return unitFirst * 3// in 1 yard 3 feets
    }
    
    var convertYardsToMiles: Double{
        return unitFirst * 0.000568182 // in 1 yard 0.000568182 miles
    }
    
    var convertMilesToMeters: Double{
        return unitFirst * 1609.34 // in 1 miles 1609.34 meters
    }
    
    var convertMilesToKilometers: Double{
        return unitFirst * 1.60934 // in 1 miles 1.60934 kilometers
    }
    
    var convertMilesToFeets: Double{
        return unitFirst * 5280 // in 1 miles 5280 feets
    }
    
    var convertMilesToYards: Double{
        return unitFirst * 1760 // in 1 miles 1760 meters
    }
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Select your units")){
                    Picker("Choose units", selection: $firstLayout){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section(header: Text("Select units which you want to convert")){
                    Picker("Choose units", selection: $secondLayout){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    HStack{
                        TextField("Number", value: $unitFirst, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        Button("Submit"){
                            amountIsFocused = false
                        }
                    }
                    
                }
                Section(header: Text("Converted value")){
                    Text(unitSecond, format: .number)
                }
            }
            .navigationTitle("Distance Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
