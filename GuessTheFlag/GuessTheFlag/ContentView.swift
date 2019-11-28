// GuessTheFlag (11/26/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  @State private var showingAlert = false
  
  var body: some View {

    Button("Show alert") {
      self.showingAlert = true
    }
    .alert(isPresented: $showingAlert) {
      Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
