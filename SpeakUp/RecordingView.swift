//
//  RecordingView.swift
//  SpeakUp
//
//  Created by Philipp on 25.09.22.
//

import SwiftUI

struct RecordingView: View {
    let recording: Recording

    var body: some View {
        NavigationLink {
            PlaybackView(recording: recording)
        } label: {
            VStack(alignment: .leading) {
                Text(recording.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.headline)

                Text(recording.transcription)
                    .lineLimit(2)
            }
        }
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView(recording: .example)
    }
}
