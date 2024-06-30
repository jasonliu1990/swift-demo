//
//  ViewModel.swift
//  SwiftTestAPI
//
//  Created by CT on 2024/2/24.
//

import Foundation


class ViewModel: ObservableObject {
    // @Published 讓其值更改時可以更新View
    @Published var fileList: [String] = []
    
    func fetchFileList() {
        print("fetch file list")
        guard let url = URL(string: "http://127.0.0.1:5000/zipfilelist") else {
            print("Invalid URL")
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
                DispatchQueue.main.async {
                    self.fileList = result.fileList
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}


struct FileListResponse: Decodable {
    let fileList: [String]
}

