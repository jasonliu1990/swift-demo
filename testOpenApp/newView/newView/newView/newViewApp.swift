//
//  newViewApp.swift
//  newView
//
//  Created by ct on 2024/5/5.
//

import SwiftUI

@main
struct newViewApp: App {
    var body: some Scene {
        WindowGroup {
            StartingWindow()
        }
        .defaultSize(CGSize(width: 600, height: 450))
        
        WindowGroup(id: "Window 1") {
            SampleView(color: .blue, text: "window1")
        }
        .defaultSize(CGSize(width: 100, height: 100))
        
    }
}
