// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var useRedText = false
  
  var body: some View {
    Button("Hello World") {
      self.useRedText.toggle()
    }
    .foregroundColor(useRedText ? .red : .blue)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
