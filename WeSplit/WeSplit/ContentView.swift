// WeSplit (11/15/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      Form {
        Section {
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
        }
        Section {
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
          Text("Hello, World!")
        }
      }
      .navigationBarTitle("SwiftUI")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
