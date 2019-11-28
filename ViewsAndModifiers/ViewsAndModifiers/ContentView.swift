// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .titleStyle()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(.blue)
  }
}

extension View {
  func titleStyle() -> some View {
    self.modifier(Title())
  }
}
