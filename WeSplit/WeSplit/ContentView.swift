// WeSplit (11/15/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  @State private var numberOfPeopleIndex = 2
  @State private var tipPercentageIndex = 2
  let tipPercentages = [10, 15, 20, 25, 0]
  
  /// Convert selected number of people entry index to its corresponding number of people
  var numberOfPeople: Int {
    return numberOfPeopleIndex + 2
  }
  
  /// Calculates share of check + tip for each person
  var totalPerPerson: Double {
    let splitWays = Double(numberOfPeople)
    let tipPercentage = Double(tipPercentages[tipPercentageIndex])
    let orderAmount = Double(checkAmount) ?? 0
    return orderAmount * (tipPercentage / 100 + 1.0) / splitWays
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          Picker("Number of People", selection: $numberOfPeopleIndex) {
            ForEach(2 ..< 100) {
              Text("\($0) people")
            }
          }
        }
        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip Percentage", selection: $tipPercentageIndex) {
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
