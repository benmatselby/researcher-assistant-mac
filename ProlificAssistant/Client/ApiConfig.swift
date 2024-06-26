//
//  Config.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 21/12/2022.
//

import Foundation
import KeychainAccess

/// Responsible for understanding configuration for talking to the Prolific API.
class ApiConfig {
  /// API URL to connect to Prolific.
  var apiURL: String

  /// App URL to load up the Prolific web application.
  var appURL: String

  /// The keychain object we are using to store/retrieve the API Token.
  var keychain: Keychain

  /// The Key we use in the Keychain item.
  var keychainKey: String = "apiToken"

  /// Constructor
  init() {
    self.apiURL = "https://api.prolific.com/api"
    self.appURL = "https://app.prolific.com/"

    let bundle = Bundle.main.bundleIdentifier!
    self.keychain = Keychain(service: bundle)
      .label("api.prolific.com")
      .synchronizable(true)
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
  func setApiToken(apiToken: String) {
    self.keychain[self.keychainKey] = apiToken
  }

  /// Retrieve the API Token
  ///
  /// - Returns: API Token from Keychain
  func getApiToken() -> String {
    return self.keychain[self.keychainKey] ?? ""
  }

  /// Get the API URL
  ///
  /// - Returns: An API URL
  func getApiUrl() -> String {
    return self.apiURL
  }

  /// Get the Application URL
  ///
  /// - Returnes: The application URL
  func getAppUrl() -> String {
    return self.appURL
  }
}
