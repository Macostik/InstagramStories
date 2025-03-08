//
//  Instagram_testApp.swift
//  Instagram_test
//
//  Created by Yurii Hranchenko on 08.03.2025.
// 
// Copyright © 2025
// All Rights Reserved.
//


import SwiftUI
import CoreData

@main
struct Instagram_testApp: App {
    var body: some Scene {
        WindowGroup {
            InstagramStoryView()
                .environment(\.managedObjectContext,
                              PersistenceController.shared.container.viewContext)
        }
    }
}
