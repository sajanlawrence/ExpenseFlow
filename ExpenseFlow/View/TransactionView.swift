//
//  TransactionView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI
import CoreData

struct TransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest private var expenses: FetchedResults<Expenses>
    @State private var viewModel = TransactionViewModel()
    @State private var showAddExpenseView: Bool = false
    @Binding private var currentFilter: ExpenseFilter
    init(filter: ExpenseFilter, selectedFilter: Binding<ExpenseFilter>) {
        _expenses = FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)],
                                 predicate: ExpensePredicateBuilder.predicate(for: filter),
                                 animation: .bouncy)
        self._currentFilter = selectedFilter
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(expenses.map { $0.toModel() }) { expense in
                        NavigationLink {
                            ExpenseDetailView(expense: expense)
                        } label: {
                            ExpenseRowView(expense: expense)
                        }
                    }
                    .onDelete(perform: deleteExpense)
                }
                .overlay {
                    if expenses.count == 0{
                        VStack{
                            EmptyStateView(title: emptyTitle, imageName: Constants.noExpenseImageName, description: emptyDescription)
                            if currentFilter == .all{
                                PrimaryButton(title: "Add Expense") {
                                    showAddExpenseView.toggle()
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
            }
            .navigationTitle("ExpenseFlow")
            .toolbar(content: {
                ToolbarItem {
                    EditButton()
                }
                ToolbarItem {
                    Button("Add", systemImage: "plus") {
                        showAddExpenseView.toggle()
                    }
                }
                
            })
            .sheet(isPresented: $showAddExpenseView) {
                AddExpenseView(viewModel: viewModel)
            }
        }
    }
    
    func deleteExpense(at offsets: IndexSet){
        for index in offsets{
            let item = expenses[index]
            viewModel.deleteExpense(expense: item)
        }
    }
}

extension TransactionView{
    private var emptyTitle: String {
        switch currentFilter {
        case .all:
            return Constants.noExpenseTitle
        default:
            return Constants.noMatchingExpenses
        }
    }

    private var emptyDescription: String {
        switch currentFilter {
        case .all:
            return Constants.noExpenseDescription
        case .today:
            return Constants.noExpenseForTodayDescription
        case .thisMonth:
            return Constants.noExpenseForThisMonthDescription
        case .category(let category):
            return "No expenses found under \(category.rawValue.capitalized). Try changing the filter."
        }
    }
}

extension Expenses {
    func toModel() -> Expense {
        Expense(
            id: id ?? UUID(),
            title: title ?? "",
            amount: amount,
            category: ExpenseCategory(rawValue: category ?? "other") ?? .other,
            date: date ?? .now,
            note: note
        )
    }
}

#Preview {
    TransactionView(filter: .all, selectedFilter: .constant(.all))
}

