//
//  ContentView.swift
//  SpeakUp
//
//  Created by Philipp on 25.09.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataController = DataController()
    @State private var isShowingRecordSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(dataController.filteredRecordings, content: RecordingView.init)
                    .onDelete(perform: dataController.delete)
            }
            .searchable(text: $dataController.filter)
            .navigationTitle("Speak Up!")
            .toolbar {
                Button {
                    isShowingRecordSheet = true
                } label: {
                    Label("New Recording", systemImage: "plus")
                }
            }
            .sheet(isPresented: $isShowingRecordSheet, content: NewRecordingView.init)
            .environmentObject(dataController)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
