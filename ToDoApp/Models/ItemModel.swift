//
//  ItemModel.swift
//  ToDoApp
//
//  Created by sarah leventon on 2024-10-23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let title: String
    let isCompleted: Bool
    let id: String
    
    
    init(id: String = UUID().uuidString, Title: String, IsCompleted: Bool) {
        self.id = id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, Title: title, IsCompleted: !isCompleted)
    }
}
