// GuessTheFlag (11/26/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {

    Button(action: {
      print("Button was touched")
    }) {
      HStack(spacing: 10) {
        Image(systemName: "pencil")
          .renderingMode(.original)
        Text("Tap me too")
      }
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
