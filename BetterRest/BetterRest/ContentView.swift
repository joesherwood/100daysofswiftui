// BetterRest (5/14/20)
// © 2020 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  
  var body: some View {
    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
      Text("\(sleepAmount, specifier: "%g") hours")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
