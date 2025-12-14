//
//  EmptyStateView.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI

struct EmptyStateView: View {
    let title: String
    let imageName: String
    let description: String
    var body: some View {
        ContentUnavailableView(title, systemImage: imageName, description: Text(description))
            .frame(height: 200)
    }
}

#Preview {
    EmptyStateView(title: Constants.noExpenseTitle, imageName: Constants.noExpenseImageName, description: Constants.noExpenseDescription)
}
