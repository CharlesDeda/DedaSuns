//
//  AppState.swift
//  DedaSuns
//
//  Created by Kody Deda on 12/10/21.
//

import SwiftUI
import ComposableArchitecture

// MARK: State
struct AppState: Equatable {
  var nsuns: IdentifiedArrayOf<NsunState>
}

enum AppAction: Equatable {
  case nsuns(id: NsunState.ID, action: NsunAction)
}

let appReducer = Reducer<AppState, AppAction, Void>.combine(
  nsunReducer.forEach(
    state: \.nsuns,
    action: /AppAction.nsuns(id:action:),
    environment: { _ in () }
  ),
  Reducer { state, action, environment in
    switch action {
      
    case .nsuns:
      return .none
    }
  }
)



extension AppState {
  static let defaultStore = Store(
    initialState: AppState(nsuns: [NsunState].createWorkout(max: 25).identifiedArray()),
    reducer: appReducer,
    environment: ()
  )
}
