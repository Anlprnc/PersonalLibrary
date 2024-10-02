//
//  LibraryViewModel.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [Book] = []
    
    func searchBooks() async {
        do {
            searchResults = try await GoogleBooksAPI.shared.searchBooks(query: searchText)
        } catch {
            print("Error saerching books: \(error)")
        }
    }
}
