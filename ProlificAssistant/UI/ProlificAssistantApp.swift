//
//  ProlificAssistantApp.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 23/11/2022.
//

import AppKit
import SwiftUI

@main
struct ProlificAssistantApp: App {
  var body: some Scene {
    MenuBarExtra("Prolific", image: "Logo") {
      MainView()
    }
    .menuBarExtraStyle(.window)
  }
}
