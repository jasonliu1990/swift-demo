//
//  CheckboxView.swift
//  testChecklist
//
//  Created by 劉家達 on 2024/6/30.
//

import Foundation
import SwiftUI

struct CheckboxView: View {
    @StateObject private var viewModel = ItemViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text("Checklist")
                    .font(.largeTitle)
                List(viewModel.items) { item in
                    HStack {
                        Checkbox(isChecked: Binding(
                            get: { viewModel.checkedItems[item.id] ?? false },
                            set: { viewModel.checkedItems[item.id] = $0 }
                        ))
                        Text(item.name)
                    }
                }
                .font(.largeTitle)
                .padding()
                .onAppear {
                    viewModel.fetchItems()
                }
                
            }
            .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.4)
        }
    }
}




struct Checkbox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .foregroundColor(isChecked ? .blue : .gray)
                .font(.system(size: 40))
        }
        .buttonStyle(PlainButtonStyle())  // 防止按鈕背景顏色變化
    }
}
