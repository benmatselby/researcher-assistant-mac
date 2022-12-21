//
//  Client.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 19/12/2022.
//

import Foundation

/**
 Responsible for acting as the facade onto the Prolific API.
 */
class Client {
    var config: ApiConfig

    init() {
        self.config = ApiConfig()
    }

    /**
     Responsible for getting studies from the API.
     */
    func getStudies(status: StudyStatus) async -> [Study] {
        if self.config.getApiToken() == "" {
            return []
        }

        var studies: Studies = Studies(results: [])

        var urlFragment = "active=1"

        if status == .Draft {
            urlFragment = "draft=1"
        }

        var request = URLRequest(url: URL(string: self.config.getApiUrl() + "/v1/studies/?" + urlFragment)!)
        request.httpMethod = "GET"
        request.setValue("Token " + self.config.getApiToken(), forHTTPHeaderField: "Authorization")

        let (data, _) = try! await URLSession.shared.data(for: request)
        studies = try! JSONDecoder().decode(Studies.self, from: (data))

        return studies.results
    }
}
