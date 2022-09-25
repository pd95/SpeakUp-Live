//
//  NewRecordingView.swift
//  SpeakUp
//
//  Created by Philipp on 25.09.22.
//

import SwiftUI

struct NewRecordingView: View {
    @StateObject private var recorder = Recorder()
    @EnvironmentObject private var dataController: DataController
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            switch recorder.recordingState {
            case .waiting:
                Button(action: recorder.requestRecordingPermission) {
                    Label("Start Recording", systemImage: "record.circle")
                        .font(.title)
                }
            case .recording:
                Button(action: recorder.stopRecording) {
                    Label("Stop Recording", systemImage: "stop.circle")
                        .font(.title)
                }

            case .transcribing:
                VStack {
                    Text("Transcribing…")
                    ProgressView()
                }

            case .complete(let recording):
                VStack {
                    ScrollView {
                        Text(recording.transcription)
                            .padding()
                    }
                    Button("Save") {
                        dataController.add(recording: recording)
                        dismiss()
                    }
                }
            }

            Text(recorder.errorMessage)
        }
    }
}

struct NewRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecordingView()
            .environmentObject(DataController())
    }
}
