//
//  Client.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 19/12/2022.
//

import Foundation

/// Responsible for acting as the facade onto the Prolific API.
class Client {
  /// The API Config that has the API Token
  var config: ApiConfig

  /// Constructor
  init() {
    self.config = ApiConfig()
  }

  /// Responsible for getting studies from the API.
  /// - Parameter status: The Study status we want to filter on. This isn't a publicly documented API, but hey ho
  /// - Returns: An array of Studies
  func getStudies(status: StudyStatus) async -> [Study] {
    if !self.config.isValid() {
      return []
    }

    var urlFragment = "active=1"

    if status == .Draft {
      urlFragment = "draft=1"
    }

    var request = URLRequest(
      url: URL(string: self.config.getApiUrl() + "/v1/studies/?" + urlFragment)!)
    request.httpMethod = "GET"
    request.setValue("Token " + self.config.getApiToken(), forHTTPHeaderField: "Authorization")

    guard let (data, _) = try? await URLSession.shared.data(for: request) else { return [] }

    guard let studies = try? JSONDecoder().decode(Studies.self, from: (data)) else { return [] }

    return studies.results
  }
}
