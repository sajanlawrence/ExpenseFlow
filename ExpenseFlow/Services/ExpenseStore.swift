//
//  ExpenseStore.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import Foundation
import CoreData

final class ExpenseStore{
    static let shared = ExpenseStore()
    let viewContext = PersistenceController.shared.container.viewContext
    private init() {}
    
    func addExpense(expense: Expense){
        let newExpense = Expenses(context: viewContext)
        newExpense.id = UUID()
        newExpense.title = expense.title
        newExpense.amount = expense.amount
        newExpense.category = expense.category.rawValue
        newExpense.date = expense.date
        newExpense.note = expense.note
        do{
            try viewContext.save()
        }catch{
            print("Saving error: \(error.localizedDescription)")
        }
    }
    
    func deleteExpense(expense: Expenses){
        viewContext.delete(expense)
        do{
            try viewContext.save()
        }catch{
            print("Deleting error: \(error.localizedDescription)")
        }
    }
    
}
