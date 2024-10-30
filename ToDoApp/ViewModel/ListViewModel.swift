//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by sarah leventon on 2024-10-23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemsKeys: String = "items_list"
    
    init() {
        getItems()
    }
    
    func saveItems () {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKeys)
        }
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKeys) else {
            return
        }
        
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        
        self.items = saveItems
    }
    
    
    func addItem(title: String) {
        let newItem = ItemModel(Title: title, IsCompleted: false)
        items.append(newItem)
    }
    
    func update(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
