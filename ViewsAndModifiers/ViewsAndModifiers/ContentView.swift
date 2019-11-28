// ViewsAndModifiers (11/27/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  var body: some View {
    GridStack(rows: 4, columns: 4) { row, col in
      Image(systemName: "\(row * 4 + col).circle")
      Text("r\(row),c\(col)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


struct GridStack<Content: View>: View {
  let rows: Int
  let columns: Int
  let content: (Int, Int) -> Content
  
  init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
    self.rows = rows
    self.columns = columns
    self.content = content
  }
  
  var body: some View {
    VStack {
      ForEach(0 ..< rows) { row in
        HStack {
          ForEach(0 ..< self.columns) { column in
            self.content(row, column)
          }
        }
      }
    }
  }
}
