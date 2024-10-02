//
//  Item.swift
//  PersonalLibrary
//
//  Created by Anıl on 2.10.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
