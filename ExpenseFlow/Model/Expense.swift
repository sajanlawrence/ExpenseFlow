//
//  Expense.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import Foundation

struct Expense: Identifiable, Equatable, Codable{
    let id: UUID
    var title: String
    var amount: Double
    var category: ExpenseCategory
    var date: Date
    var note: String?
    
    #if DEBUG
    static let `default` = Expense(id: UUID(), title: "Fried Chicken", amount: 150, category: .food, date: .now, note: "Fried chicken from KFC")
    #endif
}
