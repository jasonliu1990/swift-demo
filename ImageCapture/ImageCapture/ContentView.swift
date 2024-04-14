//
//  ContentView.swift
//  ImageCapture
//
//  Created by CT on 2024/4/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(){
            VStack {
                Text("Golden")
                    .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                    .minimumScaleFactor(0.5)
                    .border(.black)
            }
            VStack {
                Text("Sample")
                    .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                    .minimumScaleFactor(0.5)
                    .border(.black)
            }
            VStack{
                HStack {
                    Text("A:")
                        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
                        .minimumScaleFactor(0.5)
                        .border(.black)
                }
                HStack {
                    Text("Q:")
                        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
                        .minimumScaleFactor(0.5)
                        .border(.black)
                }
            }
                .ornament(
                    visibility: .visible,
                    attachmentAnchor: .scene(.trailing),
                    contentAlignment: .bottom
                ) {
                    VStack {
                        Button("Golden", systemImage: "star.fill") {
                            print("golden")
                        }
                        
                        Button("Sample", systemImage: "photo.fill") {
                            print("sample")
                        }
                        
                        Button("Bounding Box", systemImage: "square") {
                            print("plot")
                        }
                        
                        Button("Reset", systemImage: "trash.fill") {
                            print("reset")
                        }
                    }
                    .labelStyle(.iconOnly)
                    .padding(.vertical)
                    .glassBackgroundEffect()
                }
        }
        .frame(minWidth: 900, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
