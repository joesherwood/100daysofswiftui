// GuessTheFlag (11/26/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var correctTotal = 0
  
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  @State private var correctAnswer = Int.random(in: 0...2)
  
  var body: some View {
    ZStack{
      LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 30) {
        VStack {
          Text("Tap the flag of")
            .foregroundColor(Color.white)
          Text(countries[correctAnswer])
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }
        
        ForEach(0 ..< 3) { number in
          Button(action: {
            self.flagTapped(number)
          }) {
            FlagImage(country: self.countries[number])
          }
        }
        
        Text("Score: \(correctTotal)")
          .foregroundColor(Color.white)
          .font(.title)
          .fontWeight(.thin)
        
        Spacer()
      }
    }
    .alert(isPresented: $showingScore) {
      Alert(title: Text(scoreTitle), message: Text("Your score is \(correctTotal)"), dismissButton: .default(Text("Continue")) {
        self.askQuestion()
        })
    }
  }
  
  func flagTapped(_ number: Int) {
    if (number == correctAnswer) {
      scoreTitle = "Correct"
      correctTotal += 1
    }
    else {
      scoreTitle = "Wrong, that's the flag of \(countries[number])"
    }
    
    showingScore = true
  }
  
  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
  
}

struct FlagImage: View {
  var country: String
  
  var body: some View {
    Image(country)
      .renderingMode(.original)
      .clipShape(Capsule())
      .overlay(Capsule().stroke(Color.black, lineWidth: 1))
      .shadow(color: .black, radius: 2)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
