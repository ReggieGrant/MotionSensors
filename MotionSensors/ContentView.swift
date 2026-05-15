//
//  ContentView.swift
//  MotionSensors
//
//  Created by Reginald Grant on 5/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MotionView()
}
