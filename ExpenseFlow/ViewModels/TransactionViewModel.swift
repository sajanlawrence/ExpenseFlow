//
//  TransactionViewModel.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import Foundation
import SwiftUI

struct CategoryExpense: Identifiable {
    let id = UUID()
    let category: ExpenseCategory
    let total: Double
}

@Observable
class TransactionViewModel{
    var expenseStore = ExpenseStore.shared
    
    func addExpense(title: String, amount: String, category: ExpenseCategory, note: String){
        let expense = Expense(id: UUID(), title: title, amount: Double(amount) ?? 0.0, category: category, date: .now, note: note)
        expenseStore.addExpense(expense: expense)
    }
    
    func deleteExpense(expense: Expenses){
        expenseStore.deleteExpense(expense: expense)
    }
    
    func isValid(title: String, amount: String) -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard let value = Double(amount), value > 0 else { return false }
        return true
    }
}
