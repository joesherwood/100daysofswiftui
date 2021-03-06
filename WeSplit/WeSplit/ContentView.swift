// WeSplit (11/15/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = ""
  @State private var numberOfPeopleEntry = ""
  @State private var tipPercentageIndex = 2
  let tipPercentages = [10, 15, 20, 25, 0]
  
  /// Convert selected number of people text into an integer
  var numberOfPeople: Int {
    return Int(numberOfPeopleEntry) ?? 1
  }
  
  /// Calculates share of check + tip for each person
  var totalPerPerson: Double {
    let splitWays = Double(numberOfPeople)
    let tipPercentage = Double(tipPercentages[tipPercentageIndex])
    let orderAmount = Double(checkAmount) ?? 0
    return orderAmount * (tipPercentage / 100 + 1.0) / splitWays
  }
  
  /// Calculates total bill (check + tip)
  var total: Double {
    let tipPercentage = Double(tipPercentages[tipPercentageIndex])
    let orderAmount = Double(checkAmount) ?? 0
    return orderAmount * (tipPercentage / 100 + 1.0)
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          TextField("Number of people", text: $numberOfPeopleEntry)
            .keyboardType(.decimalPad)
        }
        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip Percentage", selection: $tipPercentageIndex) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        Section(header: Text("Amount per person")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
        Section(header: Text("Total amount")) {
          Text("$\(total, specifier: "%.2f")")
            .foregroundColor(tipPercentageIndex == 4 ? .red : .black)
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
