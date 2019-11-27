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
  @State private var valueEntry = ""
  
  private let unitToMeasurementUnit = [Unit.celsius: UnitTemperature.celsius,
                                       Unit.fahrenheit: UnitTemperature.fahrenheit,
                                       Unit.kelvin: UnitTemperature.kelvin]
  
  private var value: Double? {
    return Double(valueEntry) ?? nil
  }
  
  private var baseValue: Measurement<UnitTemperature> {
    let value = Measurement(value: self.value ?? 0, unit: unitToMeasurementUnit[convertFrom]!)
    return value.converted(to: UnitTemperature.celsius)
  }
  
  var body: some View {
    Form {
      
      Section(header: Text("Convert")) {
        TextField("degrees", text: $valueEntry)
          .keyboardType(.decimalPad)
        
        Picker("convert from unit", selection: $convertFrom) {
          ForEach(availableUnits, id: \.self) { unit in
            Text("\(unit.rawValue)")
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      
      Section(header: Text("to")) {
        Picker("convert to unit", selection: $convertTo) {
          ForEach(availableUnits, id: \.self) { unit in
            Text("\(unit.rawValue)")
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      
      if (self.value != nil) {
        Section {
          Text("\(baseValue.converted(to: unitToMeasurementUnit[convertTo]!).value, specifier: "%.1f")")
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
