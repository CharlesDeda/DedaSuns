//
//  AppView.swift
//  DedaSuns
//
//  Created by Kody Deda on 12/10/21.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        ScrollView {
          VStack(alignment: .leading) {
            ForEachStore(store.scope(
              state: \.nsuns,
              action: AppAction.nsuns
            ), content: NsunView.init(store:))
          }
        }
        .navigationBarTitle("Nsuns")
      }
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: AppState.defaultStore)
  }
}
