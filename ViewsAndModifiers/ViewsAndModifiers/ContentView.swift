// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var motto1: some View { Text("Draco dormiens") }
  let motto2 = Text("nanquam titillandus")
  
  var body: some View {
    VStack {
      motto1
        .foregroundColor(.red)
      motto2
        .foregroundColor(.blue)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
