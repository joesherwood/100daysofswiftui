// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .padding()
      .background(Color.red)
      .padding()
      .background(Color.blue)
      .padding()
      .background(Color.green)
      .padding()
      .background(Color.yellow)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
