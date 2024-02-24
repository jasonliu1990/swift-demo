//
//  ContentView.swift
//  SwiftTestAPI
//
//  Created by CT on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFile: String = ""
    @State private var fileList: [String] = []
    
    var body: some View {
        VStack {
            Picker("選擇檔案", selection: $selectedFile) {
                ForEach(fileList, id: \.self) {
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
            fetchFileList()
        }
    }
    
    func fetchFileList() {
        print("fetch file list")
        guard let url = URL(string: "http://127.0.0.1:5000/zipfilelist") else {
            print("Invaild URL")
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else{
                print("No data received")
                return
            }
            do {
                let result = try JSONDecoder().decode(FileListResponse.self, from: data)
                self.fileList = result.fileList
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}


struct FileListResponse: Decodable {
    let fileList: [String]
}


#Preview {
    ContentView()
}
