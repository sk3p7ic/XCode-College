//
//  ContentView.swift
//  WeSplit
//
//  Created by Joshua Ibrom on 1/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    @FocusState private var numPeopleIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    // Calculate total per person
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal / peopleCount
    }
    
    var baseTotal: Double {
        return checkAmount + (checkAmount / 100 * Double(tipPercentage))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    TextField(
                        "Number of people",
                        value: $numberOfPeople,
                        format: .number
                    )
                    .keyboardType(.numberPad)
                    .focused($numPeopleIsFocused)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(
                        baseTotal,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                } header: {
                    Text("Amount + Tip (No Division)")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                        numPeopleIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
