//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 16/01/2024.
//

import SwiftUI

// 39.4 for next practice (project 8)

@main
struct SwiftUIPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            Project1()
//            Project1part2()
//            ButtonAndAlert()
//            GuessTheFlag()
//            ViewsAndModifiers()
//            PaperScissorsRock()
//            BetterRest()
//            WordScramble()
//            Animations()
//            iExpenseMainView()
//            ExpensesAppView()
            MoonshotMainView()
        }
    }
}
