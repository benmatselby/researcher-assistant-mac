//
//  SettingsView.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 21/12/2022.
//

import SwiftUI


/// Responsible for getting all the settings required for the app to run
struct SettingsView: View {

    /// Store the API Token within the view, so we can save it in the API Config
    @State private var apiToken: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            let config = ApiConfig()

            Text("API Token")
            TextField(config.getApiToken(), text: $apiToken).onSubmit {
                config.setApiToken(apiToken: apiToken)
            }
        }.padding(20)
    }
}
