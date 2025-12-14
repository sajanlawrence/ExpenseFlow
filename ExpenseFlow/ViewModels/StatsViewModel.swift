//
//  StatsViewModel.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 14/12/25.
//

import Foundation
import SwiftUI

class StatsViewModel{
    func categoryTotals(from expenses: FetchedResults<Expenses>) -> [CategoryExpense] {
        let grouped = Dictionary(grouping: expenses, by: { $0.category })
        
        return grouped.map { key, value in
            CategoryExpense(
                category: ExpenseCategory(rawValue: key ?? "") ?? .food,
                total: value.reduce(0) { $0 + $1.amount }
            )
        }
        .sorted { $0.total > $1.total }
    }
    
    func totalExpense(from expenses: FetchedResults<Expenses>) -> Double {
        expenses.reduce(0) { $0 + $1.amount }
    }
}
