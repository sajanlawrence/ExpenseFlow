//
//  ExpensePieChartView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 14/12/25.
//

import SwiftUI
import Charts

struct ExpensePieChartView: View {
    let data: [CategoryExpense]
    let total: Double
    
    var body: some View {
        VStack{
            Chart(data) { item in
                SectorMark(
                    angle: .value("Amount", item.total),
                    innerRadius: .ratio(0.6),
                    angularInset: 2
                )
                .foregroundStyle(by: .value("Category", item.category.rawValue))
            }
            .chartForegroundStyleScale([
                ExpenseCategory.food.rawValue: ExpenseCategory.food.color,
                ExpenseCategory.transport.rawValue: ExpenseCategory.transport.color,
                ExpenseCategory.shopping.rawValue: ExpenseCategory.shopping.color,
                ExpenseCategory.bills.rawValue: ExpenseCategory.bills.color,
                ExpenseCategory.entertainment.rawValue: ExpenseCategory.entertainment.color,
                ExpenseCategory.health.rawValue: ExpenseCategory.health.color,
                ExpenseCategory.other.rawValue: ExpenseCategory.other.color
            ])
            .frame(height: 260)
        }
        
        VStack(spacing: 4) {
            Text("Total Expense")
                .font(.title)
                .bold()
            
            Text(total.formatted(.currency(code: "INR")))
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ExpensePieChartView(data: [], total: 0.0)
}
