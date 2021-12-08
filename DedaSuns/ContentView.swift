//
//  ContentView.swift
//  DedaSuns
//
//  Created by Nick Deda on 12/8/21.
//

import SwiftUI

struct ContentView: View {
  @State var max = 235
  
  var body: some View {
    NavigationView {
      Form {
        Section("Max") {
          HStack {
            TextField.init(
              "Max",
              value: $max,
              formatter: NumberFormatter()
            )
            Stepper.init(
              "",
              onIncrement: {
                max += 5
              },
              onDecrement: {
                max -= 5
              }
            )
          }
        }
       
        
        Section("Workout") {
          List(NsunsWorkout(max: max).nsunsSets) { nsuns in
            HStack {
              Text("\(nsuns.reps) x \(nsuns.weight) lb")
              Spacer()
              Text("\(nsuns.percentage)%")
                .foregroundColor(.gray)
            }
          }
        }
      }
      .navigationTitle("Deda Suns")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
