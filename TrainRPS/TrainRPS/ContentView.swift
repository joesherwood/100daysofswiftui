// TrainRPS (11/30/19)
// © 2019 Joe Sherwood. All rights reserved.

import SwiftUI

enum Move: String, CaseIterable {
  case rock = "hexagon.fill"
  case paper = "map.fill"
  case scissors = "scissors"
}

struct ContentView: View {
  @State var cpuMove = Move.allCases.randomElement() ?? Move.rock
  @State var winningMove = Bool.random()
  
  var body: some View {
    HStack {
      Text(winningMove ? "Beat" : "Lose to")
        .font(.title)
      Image(systemName: cpuMove.rawValue)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 50, height: 50)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
