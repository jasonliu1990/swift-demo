//
//  ContentView.swift
//  SwiftTestAPI
//
//  Created by CT on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFile: String = ""
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Picker("選擇檔案", selection: $selectedFile) {
                ForEach(viewModel.fileList, id: \.self) {
                    file in Text(file)
                }
            }
            .pickerStyle(DefaultPickerStyle())
            .padding()
            
            Text("你選的是 \(selectedFile)")
                .padding()
            
            Button("Download File") {
                let downloadPath = "http://127.0.0.1:5000/download/\(selectedFile)"
                Task{
                    print(downloadPath)
                }
            }
        }
        .onAppear {
            // 調用 viewModel.fetchFileList() 獲取文件清單
            viewModel.fetchFileList()
        }
    }
}

#Preview {
    ContentView()
}
