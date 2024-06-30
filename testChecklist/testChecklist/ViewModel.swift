//
//  ViewModel.swift
//  testChecklist
//
//  Created by ct on 2024/6/30.
//

import Foundation


class ItemViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var checkedItems: [UUID: Bool] = [:]
    
    private var apiService = ApiService()
    
    func fetchItems() {
        apiService.fetchItems { [weak self] items in
            self?.items = items
            self?.checkedItems = [:]
        }
    }
}
