// GuessTheFlag (11/26/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  
  var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
  var correctAnswer = Int.random(in: 0...2)
  
  var body: some View {
    ZStack{
      Color.blue.edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 30) {
        VStack {
          Text("Tap the flag of")
            .foregroundColor(Color.white)
          Text(countries[correctAnswer])
            .foregroundColor(Color.white)
        }
        
        ForEach(0 ..< 3) { number in
          Button(action: {
          }) {
            Image(self.countries[number])
              .renderingMode(.original)
          }
        }
        
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
