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
  
  private let unitToMeasurementUnit = [Unit.celsius: UnitTemperature.celsius,
                                       Unit.fahrenheit: UnitTemperature.fahrenheit,
                                       Unit.kelvin: UnitTemperature.kelvin]
  
  private var convertValue: Double {
    return Double(convertValueText) ?? 0
  }
  
  private var baseValue: Measurement<UnitTemperature> {
    let value = Measurement(value: self.convertValue, unit: unitToMeasurementUnit[convertFrom]!)
    return value.converted(to: UnitTemperature.celsius)
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
      
      Section {
        Text("\(baseValue.converted(to: unitToMeasurementUnit[convertTo]!).value)")
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
