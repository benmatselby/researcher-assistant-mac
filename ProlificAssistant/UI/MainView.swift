//
//  MainView.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 21/12/2022.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    VStack(alignment: .trailing) {
      // https://developer.apple.com/documentation/swiftui/tabview
      TabView {
        ActiveStudyView(state: StudyStatus.Active)
          .badge(2)
          .tabItem {
            Label("Active studies", systemImage: "tray.and.arrow.down.fill")
          }

        ActiveStudyView(state: StudyStatus.Draft)
          .badge(2)
          .tabItem {
            Label("Draft studies", systemImage: "tray.and.arrow.down.fill")
          }

        SettingsView().tabItem {
          Label("Settings", systemImage: "hammer")
        }
      }

      HStack {
        Button("Quit") {
          NSApplication.shared.terminate(self)
        }.keyboardShortcut("q")
      }
    }
    .frame(width: 400.0).padding(20)
  }
}
