// WeSplit (11/15/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  let tipPercentages = [10, 15, 20, 25, 0]
  
  
  /// Calculates share of check + tip for each person
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    return orderAmount * (tipSelection / 100 + 1.0) / peopleCount
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          Picker("Number of People", selection: $numberOfPeople) {
            ForEach(2 ..< 100) {
              Text("\($0) people")
            }
          }
        }
        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        Section {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
      }.navigationBarTitle("WeSplit")
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
