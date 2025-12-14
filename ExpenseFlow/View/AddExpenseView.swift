//
//  AddExpenseView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI

struct AddExpenseView: View {
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var note: String = ""
    @State private var category: ExpenseCategory = .food
    @Bindable var viewModel: TransactionViewModel
    @Environment(\.dismiss) var dismiss
    var isFormValid: Bool {
        viewModel.isValid(title: title, amount: amount)
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Title"){
                    HStack{
                        TextField("Enter expense title", text: $title)
                            .padding()
                            .frame(width: 250, height: 30)
                            .textInputAutocapitalization(.words)
                            
                    }
                }
                Section("Amount"){
                    HStack{
                        TextField("Enter expense amount", text: $amount)
                            .padding()
                            .frame(width: 250, height: 30)
                            .keyboardType(.decimalPad)
                            
                    }
                }
                
                Section("Select Category"){
                    HStack{
                        Picker("Category", selection: $category) {
                            ForEach(ExpenseCategory.allCases) { item in
                                Text(item.rawValue.capitalized)
                                    .tag(item)
                            }
                        }
                            
                    }
                }
                
                Section("Note"){
                    HStack{
                        TextField("Enter your note", text: $note)
                            .padding()
                            .frame(width: 250, height: 30)
                            
                    }
                }
                
                PrimaryButton(title: "Save Expense") {
                    viewModel.addExpense(title: title, amount: amount, category: category, note: note)
                    dismiss()
                }
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1 : 0.95)
            }
            .navigationTitle("Add Expense")
        }
    }
}

#Preview {
    AddExpenseView(viewModel: TransactionViewModel())
}
