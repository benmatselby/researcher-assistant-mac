//
//  Study.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 19/12/2022.
//

import Foundation

/// Responsible for representing a Study object from the JSON API results. Casing is important.
struct Study: Codable, Hashable {
  var id: String
  var name: String
  var total_available_places: Int

  /**
     Get the application URL for the study.
     */
  func getAppURL() -> String {
    return "https://app.prolific.co/researcher/workspaces/studies/" + self.id + "/"
  }
}

/// Responsible for representing an array of studies from the JSON API results. Casing is important.
struct Studies: Codable {
  var results: [Study]
}

/// Provide some kind of study status mapping
enum StudyStatus {
  case Draft
  case Active

  var description: String {
    switch self {
    case .Draft: return "Draft"
    case .Active: return "Active"
    }
  }
}
