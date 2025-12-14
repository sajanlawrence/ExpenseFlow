//
//  ExpenseRowView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI

import SwiftUI

struct ExpenseRowView: View {
    let expense: Expense

    var body: some View {
        HStack(spacing: 12) {
            categoryIcon

            VStack(alignment: .leading, spacing: 4) {
                Text(expense.title)
                    .font(.headline)

                Text(expense.category.rawValue.capitalized)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(expense.amount, format: .currency(code: "INR"))
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(expense.date, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

extension ExpenseRowView {
    private var categoryIcon: some View {
        Image(systemName: expense.category.icon)
            .frame(width: 36, height: 36)
            .background(expense.category.color.opacity(0.15))
            .foregroundStyle(expense.category.color)
            .clipShape(Circle())
    }
}


#Preview {
    ExpenseRowView(expense: .default)
}
