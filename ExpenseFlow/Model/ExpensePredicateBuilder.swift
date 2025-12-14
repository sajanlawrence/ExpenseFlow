//
//  ExpensePredicateBuilder.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 14/12/25.
//

import Foundation
import CoreData

enum ExpensePredicateBuilder{
    static func predicate(for filter: ExpenseFilter) -> NSPredicate? {
        switch filter {
        case .all:
            return nil
        case .today:
            return NSPredicate(format: "date >= %@ AND date <= %@", Calendar.current.startOfDay(for: .now) as NSDate, Calendar.current.date(byAdding: .day, value: 1, to: .now)! as NSDate)
        case .thisMonth:
            let start = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: .now))!
            let end = Calendar.current.date(byAdding: .month, value: 1, to: start)!
            return NSPredicate(format: "date >= %@ AND date <= %@", start as NSDate, end as NSDate)
        case .category(let expenseCategory):
            return NSPredicate(format: "category == %@", expenseCategory.rawValue)
        }
    }
}
