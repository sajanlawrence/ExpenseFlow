//
//  CategoryModel.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import Foundation
import SwiftUI

enum ExpenseCategory: String, CaseIterable, Codable, Identifiable {
    case food
    case transport
    case shopping
    case bills
    case entertainment
    case health
    case other
    
    var icon: String {
        switch self {
        case .food: return "fork.knife"
        case .transport: return "car"
        case .shopping: return "bag"
        case .bills: return "bolt"
        case .entertainment: return "film"
        case .health: return "heart"
        case .other: return "questionmark.circle"
        }
    }
    
    var color: Color {
        switch self {
        case .food: return .orange
        case .transport: return .blue
        case .shopping: return .purple
        case .bills: return .yellow
        case .entertainment: return .pink
        case .health: return .red
        case .other: return .gray
        }
    }
    
    var id: String { rawValue.capitalized }
}
