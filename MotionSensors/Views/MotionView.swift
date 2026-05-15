//
//  MotionView.swift
//  MotionSensors
//
//  Created by Reginald Grant on 5/13/26.
//

import SwiftUI

struct MotionView: View {
    @StateObject var viewModel:MotionViewModel = MotionViewModel()
    
    var body: some View {
        let levelStatus = viewModel.almostLeved()
        
        VStack(spacing: 12) {
            Text("The Motion Lab")
                .font(.title)
                .bold()
            Text(levelStatus)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Accelerometer")
                    .font(.subheadline)
                    .bold()
                Text("X: \(viewModel.accelX)")
                Text("Y: \(viewModel.accelY)")
                Text("Z: \(viewModel.accelZ)")
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Gyroscope")
                    .font(.subheadline)
                    .bold()
                Text("X: \(viewModel.gyroX)")
                Text("Y: \(viewModel.gyroY)")
                Text("Z: \(viewModel.gyroZ)")
            }
            
            Button(viewModel.isRunning ? "Stop" : "Start") {
                if viewModel.isRunning {
                    viewModel.stop()
                } else {
                    viewModel.start()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(levelStatus == "Phone is leveled" ? Color.green : Color.clear)
        .onDisappear {
            viewModel.stop()
        }
    }
}

#Preview{
    MotionView()
}

