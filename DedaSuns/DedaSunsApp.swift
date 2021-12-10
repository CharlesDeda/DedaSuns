//
//  DedaSunsApp.swift
//  DedaSuns
//
//  Created by Nick Deda on 12/8/21.
//

import SwiftUI
import ComposableArchitecture

@main
struct DedaSunsApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(store: AppState.defaultStore)
    }
  }
}
