//
//  PersonalLibraryApp.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import SwiftUI
import SwiftData

@main
struct PersonalLibraryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
