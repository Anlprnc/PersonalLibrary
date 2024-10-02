//
//  APIResponse.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import SwiftUI

struct GoogleBooksResponse: Codable {
    let items: [GoogleBookItem]
}

struct GoogleBookItem: Codable {
    let volumeInfo: VolumeInfo?
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let industryIdentifiers: [IndustryIdentifier]?
    let imageLinks: ImageLinks?
}

struct IndustryIdentifier: Codable {
    let type: String
    let identifier: String
}

struct ImageLinks: Codable {
    let thumbnail: String?
}
