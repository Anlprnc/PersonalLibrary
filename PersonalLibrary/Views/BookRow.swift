//
//  BookRow.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import SwiftUI

struct BookRow: View {
    let book: Book
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: book.coverUrl ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 75)
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                
                Text(book.author)
                    .font(.subheadline)
                
                Text(book.readingStatus.rawValue)
                    .font(.caption)
                    .padding(4)
                    .background(statusColor(for: book.readingStatus))
                    .cornerRadius(4)
            }
        }
    }
    
    private func statusColor(for status: ReadingStatus) -> Color {
        switch status {
        case .toRead:
            return .blue
        case .reading:
            return .orange
        case .finished:
            return .green
        }
    }
}

#Preview {
    let sampleBook = Book(title: "Sample Title", author: "Sample Author", isbn: "SGEG")
    BookRow(book: sampleBook)
}
