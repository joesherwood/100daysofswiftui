// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 10) {
      CapsuleText(text: "1th")
        .foregroundColor(.white)
      CapsuleText(text: "2th")
        .foregroundColor(.yellow)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


struct CapsuleText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.largeTitle)
      .padding()
      .background(Color.blue)
      .clipShape(Capsule())
  }
}
