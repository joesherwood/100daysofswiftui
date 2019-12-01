// TrainRPS (11/30/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

enum Move: String, CaseIterable {
  case rock = "hexagon.fill"
  case paper = "map.fill"
  case scissors = "scissors"
}

struct Score {
  var correct: Int
  var attempts: Int
  
  init() {
    self.correct = 0
    self.attempts = 0
  }
  
  mutating func win() {
    self.correct += 1
    self.attempts += 1
  }
  
  mutating func lose() {
    self.attempts += 1
  }
  
  func line() -> String {
    return "\(self.correct) for \(self.attempts)"
  }
}

struct ContentView: View {
  @State var cpuMove = Move.allCases.randomElement() ?? Move.rock
  @State var shouldWin = Bool.random()
  @State var score: Score = Score()
  
  var body: some View {
    VStack {
      Text("Score \(score.line())")
        .font(.body)
        .fontWeight(.thin)
      
      HStack {
        Text(shouldWin ? "Beat" : "Lose to")
          .font(.title)
        Image(systemName: cpuMove.rawValue)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50, height: 50)
      }
      
      ForEach(Move.allCases, id: \.self) { move in
        Button(action: {
          self.checkAnswer(user: move, cpu: self.cpuMove, shouldWin: self.shouldWin)
        }) {
          ActionImage(name: move.rawValue)
        }
        .frame(height: 100)
      }
      
    }
  }
  
  func checkAnswer(user: Move, cpu: Move, shouldWin: Bool) {
    var winner: Bool = false
    if (shouldWin) {
      switch cpu {
      case .rock:
        winner = (user == .paper)
      case .paper:
        winner = (user == .scissors)
      case .scissors:
        winner = (user == .rock)
      }
    }
    else {
      switch cpu {
      case .rock:
        winner = (user == .scissors)
      case .paper:
        winner = (user == .rock)
      case .scissors:
        winner = (user == .paper)
      }
    }
    
    if (winner) {
      self.score.win()
    }
    else {
      self.score.lose()
    }
    
    self.reload()
  }
  
  func reload() {
    self.cpuMove = Move.allCases.randomElement() ?? Move.rock
    self.shouldWin = Bool.random()
  }
}

struct ActionImage: View {
  var name: String
  var body: some View {
    Image(systemName: name)
      .renderingMode(.original)
      .resizable()
      .aspectRatio(contentMode: .fit)
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(score: Score())
  }
}
