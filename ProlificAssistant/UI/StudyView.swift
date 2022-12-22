//
//  StudyView.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 20/12/2022.
//

import AppKit
import SwiftUI

struct ActiveStudyView: View {

  var state: StudyStatus
  @State var studies: [Study] = []

  var body: some View {
    VStack(alignment: .leading) {

      if studies.count == 0 {
        VStack(alignment: .center) {
          Spacer()
          Text("No active studies")
          Link("Create study..", destination: URL(string: "https://app.prolific.co")!)
          Spacer()
        }
      } else {
        List {
          ForEach(studies, id: \.self) { study in
            Link(study.name.prefix(50), destination: URL(string: study.getAppURL())!)
              .padding(.bottom, 10.0).fixedSize()
              .badge(study.total_available_places)
          }
        }
      }
    }.task {
      let now = Date()
      print("Loading " + state.description + " studies..." + now.ISO8601Format())
      studies = await Client().getStudies(status: state)
    }
  }
}
