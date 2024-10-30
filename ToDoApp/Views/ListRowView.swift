//
//  ListRowView.swift
//  ToDoApp
//
//  Created by sarah leventon on 2024-10-23.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
    }
}

#Preview {
    var item1 = ItemModel(Title: "Item 1", IsCompleted: true)
    var item2 = ItemModel(Title: "Item 2", IsCompleted: false)
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }.previewLayout(.sizeThatFits)
}
