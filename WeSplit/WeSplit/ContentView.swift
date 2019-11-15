// WeSplit (11/15/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  let students = ["Alice", "Bob", "Eve"]
  @State private var selectedStudent = 0
  
  var body: some View {
    VStack {
      Picker("Select student", selection: $selectedStudent) {
        ForEach(0 ..< students.count) {
          Text(self.students[$0])
        }
      }
      Text("You chose \(students[selectedStudent])")
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
