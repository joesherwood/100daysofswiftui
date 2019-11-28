// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    Color.blue
    .frame(width: 300, height: 300)
    .watermarked(with: "Hacking With Swift")
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
      .foregroundColor(.white)
      .padding()
      .background(Color.blue)
      .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

struct Watermark: ViewModifier {
  var text: String
  
  func body(content: Content) -> some View {
    ZStack(alignment: .bottomTrailing) {
      content
      Text(text)
        .font(.caption)
        .foregroundColor(.white)
        .padding(5)
        .background(Color.black)
    }
  }
}


extension View {
  func titleStyle() -> some View {
    self.modifier(Title())
  }
  
  func watermarked(with text: String) -> some View {
    self.modifier(Watermark(text: text))
  }
}
