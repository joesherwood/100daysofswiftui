// BetterRest (5/14/20)
// © 2020 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date()
  
  var body: some View {
    VStack {
      Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
        Text("\(sleepAmount, specifier: "%g") hours")
      }
      
      DatePicker("Please enter a date", selection: $wakeUp, in: Date()..., displayedComponents: .hourAndMinute)
        .labelsHidden()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
