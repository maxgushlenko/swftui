//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 16/01/2024.
//

import SwiftUI



@main
struct SwiftUIPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            Project1()
            Project1part2()
            
            
            
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
