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
    /**
     The base URL for the Prolific API.
     */
    var baseURL: String = "https://api.prolific.co/api"

    /**
     The API Token to auth into Prolific.
     */
    var apiToken: String = "Token xxxx"

    /**
     Responsible for getting studies from the API.
     */
    func getStudies(status: StudyStatus) async -> Studies {
        var studies: Studies = Studies(results: [])

        var urlFragment = "active=1"

        if status == .Draft {
            urlFragment = "draft=1"
        }

        var request = URLRequest(url: URL(string: self.baseURL + "/v1/studies/?" + urlFragment)!)
        request.httpMethod = "GET"
        request.setValue(self.apiToken, forHTTPHeaderField: "Authorization")

        let (data, _) = try! await URLSession.shared.data(for: request)
        studies = try! JSONDecoder().decode(Studies.self, from: (data))
        return studies
    }
}
