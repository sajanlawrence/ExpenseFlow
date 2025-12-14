//
//  ExpenseDetailView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 14/12/25.
//

import SwiftUI

struct ExpenseDetailView: View {
    let expense: Expense

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            VStack(spacing: 10){
                Text(expense.amount.formatted(.currency(code: "INR")))
                    .font(.largeTitle)
                    .bold()
                
                Label(
                    expense.category.rawValue.capitalized,
                    systemImage: expense.category.icon
                )
                .foregroundStyle(expense.category.color)
                .font(.headline)
            }

            Divider()
            VStack(alignment: .leading, spacing: 16) {
                detailRow(title: "Title", value: expense.title)
                detailRow(title: "Date", value: expense.date.formatted(date: .long, time: .omitted))
                if let note = expense.note{
                    detailRow(title: "Note", value: note)
                }else{
                    detailRow(title: "Note", value: "—")
                }
                
            }

            Spacer()
        }
        .frame(width: 300, height: 410)
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
        .clipShape(.rect)
        .shadow(radius: 20)
        .navigationTitle("Expense Details")
    }

    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.body)
        }
    }
}


#Preview {
    ExpenseDetailView(expense: .default)
}
