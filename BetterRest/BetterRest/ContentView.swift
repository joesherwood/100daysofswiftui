// BetterRest (5/14/20)
// © 2020 Joe Sherwood. All rights reserved.

import SwiftUI

struct ContentView: View {
  
  @State private var wakeUp = defaultWakeTime
  @State private var sleepAmount = 8.0
  @State private var coffeeAmount = 1
    
  var body: some View {
    NavigationView {
      VStack {
        VStack(alignment: .center, spacing: 10) {
          Text("Bedtime")
            .font(.subheadline)
          
          Text("\(calculateBedtime())")
            .font(.largeTitle)
        }
        .padding(.bottom, 60.0)
        
        Form {
          
          Section(header: Text("When do you want to wake up?")) {
            
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
              .labelsHidden()
              .datePickerStyle(WheelDatePickerStyle())
            
          }
          
          Section(header: Text("Desired amount of sleep")) {
            
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
              Text("\(sleepAmount, specifier: "%g") hours")
            }
            
          }
          
          Section(header: Text("Daily coffee intake")) {
            
            Stepper(value: $coffeeAmount, in: 0...20) {
              if (coffeeAmount == 1) {
                Text("1 cup")
              }
              else {
                Text("\(coffeeAmount) cups")
              }
            }
          }
        }
      }
    }
  }
  
  static var defaultWakeTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? Date()
  }
  
  func calculateBedtime() -> String {
    let model = BetterRestSleep()
    let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    let seconds = hour * 60 * 60 + minute * 60
    
    var bedTime = ""
    
    do {
      let prediction = try model.prediction(wake: Double(seconds), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
      let sleepTime = wakeUp - prediction.actualSleep
      
      let formatter = DateFormatter()
      formatter.timeStyle = .short
      
      bedTime = formatter.string(from: sleepTime)
    }
    catch {
      bedTime = "Never Sleep"
    }
    
    return bedTime
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
