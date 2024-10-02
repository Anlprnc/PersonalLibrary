//
//  Book.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import SwiftUI
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var isbn: String
    var coverUrl: String?
    var readingStatus: ReadingStatus
    
    init(title: String, author: String, isbn: String, coverUrl: String? = nil, readingStatus: ReadingStatus = .toRead) {
        self.title = title
        self.author = author
        self.isbn = isbn
        self.coverUrl = coverUrl
        self.readingStatus = readingStatus
    }
}

enum ReadingStatus: String, Codable, CaseIterable {
    case toRead = "To Read"
    case reading = "Reading"
    case finished = "Finished"
}
