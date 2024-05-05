//
//  SampleView.swift
//  newView
//
//  Created by CT on 2024/5/5.
//

import SwiftUI

struct SampleView: View {
    
    var color: Color
    var text: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
            
            Text(text)
                .font(.extraLargeTitle)
        }
        .padding(50)
    }
}


#Preview {
    SampleView(color: .orange, text: "test")
}
