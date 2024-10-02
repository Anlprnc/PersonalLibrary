//
//  BookDetailView.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import SwiftUI

struct BookDetailView: View {
    @Bindable var book: Book
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: URL(string: book.coverUrl ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(book.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(book.author)
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Text("ISBN: \(book.isbn)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Picker("Reading Status", selection: $book.readingStatus) {
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BookDetailView(book: Book(title: "Example Book", author: "John Doe", isbn: "1234567890", coverUrl: nil, readingStatus: .toRead))
}
