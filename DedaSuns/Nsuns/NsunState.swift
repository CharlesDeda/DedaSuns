//
//  NsunState.swift
//  DedaSuns
//
//  Created by Kody Deda on 12/10/21.
//

import SwiftUI
import ComposableArchitecture

struct NsunState: Identifiable, Equatable {
  let id: UUID
  let reps: Int
  let percentage: Int
  let weight: Int
  var complete = false
}

enum NsunAction: Equatable {
  case toggleComplete

}

let nsunReducer = Reducer<NsunState, NsunAction, Void> { state, action, _ in
  switch action {
    
  case .toggleComplete:
    state.complete.toggle()
    return .none
  }
}


extension NsunState {
  static let defaultStore = Store(
    initialState: NsunState(
      id: UUID(),
      reps: 24,
      percentage: 75,
      weight: 50
    ),
    reducer: nsunReducer,
    environment: ()
  )
}


































// MARK: [Nsun]+Extensions
extension Array where Element == NsunState {
  static func createWorkout(max: Int) -> [NsunState] {
    zip(
      [5, 3, 1, 3, 5, 3, 5, 3, 5],
      [75, 85, 95, 90, 85, 80, 75, 70, 65]
    ).map { reps, percentage -> NsunState in
        .init(
          id: UUID(),
          reps: reps,
          percentage: percentage,
          weight: Int(percentage * max / 100)
            .largestMultiple(of: 5)
        )
    }
  }
}
