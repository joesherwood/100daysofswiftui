// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("One")
        .blur(radius: 0)
      Text("Two")
      Text("Three")
      Text("Four")
    }
    .blur(radius: 5)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
