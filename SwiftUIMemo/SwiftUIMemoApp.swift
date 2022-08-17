//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 강고운 on 2022/08/17.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
} 
