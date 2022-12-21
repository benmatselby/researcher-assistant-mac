//
//  StudyView.swift
//  ProlificAssistant
//
//  Created by Ben Selby on 20/12/2022.
//

import SwiftUI
import AppKit

struct StudyView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            // https://developer.apple.com/documentation/swiftui/tabview
            TabView() {
                ActiveStudyView(state: StudyStatus.Active)
                    .badge(2)
                    .tabItem {
                        Label("Active studies", systemImage: "tray.and.arrow.down.fill")
                    }

                ActiveStudyView(state: StudyStatus.Draft)
                    .badge(2)
                    .tabItem {
                        Label("Draft studies", systemImage: "tray.and.arrow.down.fill")
                    }
            }

            HStack{
                Button("Quit") {
                    NSApplication.shared.terminate(self)
                }.keyboardShortcut("q")
            }
        }
        .frame(width: 400.0).padding(20)
    }
}

struct ActiveStudyView: View {

    var state: StudyStatus
    @State var studies: [Study] = []

    var body: some View {
        VStack(alignment: .leading) {

            if studies.count == 0 {
                VStack(alignment: .center) {
                    Spacer()
                    Text("No active studies")
                    Link("Create study..", destination: URL(string:"https://app.prolific.co")!)
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
