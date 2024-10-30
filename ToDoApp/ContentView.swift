//
//  ContentView.swift
//  ToDoApp
//
//  Created by sarah leventon on 2024-10-23.
//
import SwiftUI

struct ContentView: View {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            ListView()
        }.environmentObject(listViewModel)
    }
}

#Preview {
    ContentView()
}
