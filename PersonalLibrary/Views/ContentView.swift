//
//  ContentView.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = LibraryViewModel()
    @Environment(\.modelContext) private var modelContext
    @Query private var books: [Book]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            BookRow(book: book)
                        }
                    }
                    .onDelete(perform: deleteBooks)
                } header: {
                    Text("My Library")
                }
                
                Section {
                    ForEach(viewModel.searchResults, id: \.isbn) { book in
                        BookRow(book: book)
                            .swipeActions {
                                Button("Add") {
                                    addBook(book)
                                }
                                .tint(.green)
                        }
                    }
                } header: {
                    Text("Search Results")
                }
            }
            .navigationTitle("Personal Library")
            .searchable(text: $viewModel.searchText, prompt: "Search for Books")
            .onSubmit(of: .search) {
                Task {
                    await viewModel.searchBooks()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func addBook(_ book: Book) {
        modelContext.insert(book)
    }
    
    private func deleteBooks(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(books[index])
        }
    }
}

#Preview {
    ContentView()
}
