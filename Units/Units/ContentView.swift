// Units (11/20/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

enum Unit: String {
  case celsius = "Celsius"
  case fahrenheit = "Fahrenheit"
  case kelvin = "Kelvin"
}

struct ContentView: View {
  let availableUnits: [Unit] = [.celsius, .fahrenheit, .kelvin]
  @State private var convertFrom: Unit = .fahrenheit
  @State private var convertTo: Unit = .celsius
  @State private var convertValueText = ""
  
  private var convertValue: Double {
    return Double(convertValueText) ?? 0
  }
  
  var body: some View {
    Form {
      
      Section(header: Text("Convert")) {
        TextField("Value", text: $convertValueText)
          .keyboardType(.decimalPad)
        
        Picker("unit", selection: $convertFrom) {
          ForEach(availableUnits, id: \.self) { unit in
            Text("\(unit.rawValue)")
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      
      Section(header: Text("to")) {
        Picker("unit", selection: $convertTo) {
          ForEach(availableUnits, id: \.self) { unit in
            Text("\(unit.rawValue)")
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
