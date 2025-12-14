//
//  TransactionContainerView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 14/12/25.
//

import SwiftUI

struct TransactionContainerView: View {
    @State private var selectedFilter: ExpenseFilter = .all
    var body: some View {
        NavigationStack{
            TransactionView(filter: selectedFilter, selectedFilter: $selectedFilter)
                .toolbar {
                    filterToolBar
                }
        }
    }
}

extension TransactionContainerView{
    private var filterToolBar: some ToolbarContent{
        ToolbarItem {
            Menu {
                Button("All") { selectedFilter = .all }
                Button("Today") { selectedFilter = .today }
                Button("This Month") { selectedFilter = .thisMonth }
                Menu("Category") {
                    ForEach(ExpenseCategory.allCases) { category in
                        Button(category.rawValue.capitalized) {
                            selectedFilter = .category(category)
                        }
                    }
                }
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
        }
    }
}

#Preview {
    TransactionContainerView()
}
