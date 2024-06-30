//
//  ContentView.swift
//  newView
//
//  Created by ct on 2024/5/5.
//

import SwiftUI
import RealityKit
import RealityKitContent


//https://www.youtube.com/watch?v=b_V19d_sdOw

struct StartingWindow: View {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack (spacing: 30){
            Image(systemName: "visionpro")
                .font(.system(size: 150))
                .symbolEffect(.pulse)
                .bold()
            
            
            // buttons
            HStack {
                Button("windows 1") {
                    openWindow(id: "Window 1")
                }
                
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    StartingWindow()
}
