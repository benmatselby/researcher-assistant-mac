//
//  Config.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 21/12/2022.
//

import Foundation

/// Responsible for understanding configuration for talking to the Prolific API
class ApiConfig {
    /// API URL
    var apiURL: String

    /// Constructor
    init() {
        self.apiURL = "https://api.prolific.co/api"
    }

    /// Check to see if the API Config is valid
    /// - Returns: Whether or not the API Config is valid, and therefore clients can make a valid request.
    func isValid() -> Bool {
        if self.getApiToken() == "" {
            return false
        }

        return true
    }

    /// Setter for the API Token
    ///
    /// - Parameter apiToken: The Token used to talk to Prolific
    func setApiToken(apiToken: String) -> Void {
        Keychain.setApiToken(
            url: self.getApiUrl(),
            password: apiToken,
            identifier: Bundle.main.bundleIdentifier ?? ""
        )
    }

    /// Retrieve the API Token
    ///
    /// - Returns: API Token from Keychina
    func getApiToken() -> String {
        return Keychain.getApiToken(url: self.getApiUrl(), identifier: Bundle.main.bundleIdentifier ?? "")
    }

    func getApiUrl() -> String {
        return self.apiURL
    }
}
