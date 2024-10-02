//
//  GoogleBooksAPI.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import Foundation

class GoogleBooksAPI {
    static let shared = GoogleBooksAPI()
    private let baseURL: String = "https://www.googleapis.com/books/v1/volumes?q="
    
    func searchBooks(query: String) async throws -> [Book] {
        guard let url = URL(string: baseURL + query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(GoogleBooksResponse.self, from: data)
        
        return result.items.compactMap { item in
            guard let volumeInfo = item.volumeInfo,
                  let title = volumeInfo.title,
                  let authors = volumeInfo.authors,
                  let isbn = volumeInfo.industryIdentifiers?.first(where: { $0.type == "ISBN_13" })?.identifier
            else { return nil }
            
            return Book(title: title, author: authors.joined(separator: ", "), isbn: isbn, coverUrl: volumeInfo.imageLinks?.thumbnail)
        }
    }
}
