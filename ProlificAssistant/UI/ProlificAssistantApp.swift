//
//  ProlificAssistantApp.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 23/11/2022.
//

import SwiftUI
import AppKit

@main
struct ProlificAssistantApp: App {
    var body: some Scene {
        MenuBarExtra("Prolific", image: "Logo") {
            MainView()
        }.menuBarExtraStyle(.window)
    }
}
