//
//  NsunView.swift
//  DedaSuns
//
//  Created by Kody Deda on 12/10/21.
//

import SwiftUI
import ComposableArchitecture

struct NsunView: View {
  let store: Store<NsunState, NsunAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      HStack {
        ToggleButton(store: store)
        Text("Weight: \(viewStore.weight.description)")
        Text("Percentage: \(viewStore.percentage.description)")
        Text("Reps: \(viewStore.reps.description)")
        
        Spacer()
      }
      .padding()
    }
  }
}


struct ToggleButton: View {
  let store: Store<NsunState, NsunAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      Button(action: { viewStore.send(.toggleComplete) }) {
        Image(systemName: "\(viewStore.complete ? "circle.circle" : "circle")")
      }
    }
  }
}


struct NsunView_Previews: PreviewProvider {
  static var previews: some View {
    NsunView(store: NsunState.defaultStore)
  }
}

