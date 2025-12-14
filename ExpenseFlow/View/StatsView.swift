//
//  StatsView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI
import Charts
import CoreData

struct StatsView: View {
    @FetchRequest(sortDescriptors: []) private var expenses: FetchedResults<Expenses>
    @State private var viewModel = StatsViewModel()
    
    
    var body: some View {
        NavigationStack {
            VStack{
                let chartData = viewModel.categoryTotals(from: expenses)
                let totalExpense = viewModel.totalExpense(from: expenses)
                if chartData.isEmpty {
                    ContentUnavailableView(
                        "No Data for Chart",
                        systemImage: "chart.pie",
                        description: Text("Add expenses to see category distribution.")
                    )
                } else {
                    ScrollView {
                        VStack(spacing: 24) {
                            ExpensePieChartView(data: chartData, total: totalExpense)
                            categoryLegend(chartData)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Statistics")
        }
    }
    
    private func categoryLegend(_ data: [CategoryExpense]) -> some View {
           VStack(alignment: .leading, spacing: 12) {
               ForEach(data) { item in
                   HStack {
                       Circle()
                           .fill(item.category.color)
                           .frame(width: 10, height: 10)

                       Text(item.category.rawValue.capitalized)
                       Spacer()
                       Text(item.total.formatted(.currency(code: "INR")))
                           .bold()
                   }
               }
           }
           .padding()
       }
}



#Preview {
    //StatsView(expenses: <#FetchRequest<Expenses>#>)
}
