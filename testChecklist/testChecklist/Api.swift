//
//  Api.swift
//  testChecklist
//
//  Created by ct on 2024/6/30.
//
import Foundation

class ApiService {
    func fetchItems(completion: @escaping ([KeyStepItem]) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:5000/testlist") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    // 返回的是 ["1. aaa", "2. bbb", "3. ccc"]
                    let list = try JSONDecoder().decode([String].self, from: data)
                    let items = list.map { KeyStepItem(name: $0) }
                    DispatchQueue.main.async {
                        completion(items)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
