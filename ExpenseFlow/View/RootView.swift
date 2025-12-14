//
//  RootView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Transactions", systemImage: "text.book.closed") {
                TransactionContainerView()
            }
               
            Tab("Stats", systemImage: "chart.pie.fill") {
                StatsView()
            }
        }
    }
}

#Preview {
    RootView()
}
