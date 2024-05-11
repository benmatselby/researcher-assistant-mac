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
  @State private var overText = ""
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    let config = ApiConfig()

    VStack(alignment: .leading) {

      if studies.count == 0 {
        VStack(alignment: .center) {
          Spacer()
          Text("No active studies")
          Link("Create study..", destination: URL(string: config.getAppUrl())!)
          Spacer()
        }
      } else {
        List {
          ForEach(studies, id: \.self) { study in
            Link(study.name.prefix(50), destination: URL(string: study.getURL())!)
              .fixedSize()
              .badge(study.total_available_places)
              .padding(5)
              .foregroundColor(colorScheme == .dark ? .white : .black)
              .background(overText == study.id ? Color.accentColor : Color(.clear))
              .onHover(perform: { hovering in
                  overText = study.id
              })
              .cornerRadius(5)
          }
          .listRowSeparator(.hidden)
        }
      }
    }.task {
      let now = Date()
      print("Loading " + state.description + " studies..." + now.ISO8601Format())
      studies = await Client().getStudies(status: state)
    }
  }
}
