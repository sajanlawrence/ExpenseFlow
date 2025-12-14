//
//  ExpenseFilter.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 14/12/25.
//

import Foundation

enum ExpenseFilter: Equatable, Hashable {
    case all
    case today
    case thisMonth
    case category(ExpenseCategory)
}
