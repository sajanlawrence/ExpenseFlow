//
//  ExpenseFlowApp.swift
//  ExpenseFlow
//
//  Created by Sajan Lawrence on 13/12/25.
//

import SwiftUI
import CoreData

@main
struct ExpenseFlowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
