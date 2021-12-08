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
        Stepper("Max \(max)", value: $max)
        
        Section {
          List(NsunsWorkout(max: max).nsunsSets) { nsuns in
            HStack {
              Text("Percent: \(nsuns.percentage)%")
              Text("Weight: \(nsuns.weight)")
              Text("Reps: \(nsuns.reps)")
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
