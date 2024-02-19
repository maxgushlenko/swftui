//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 16/01/2024.
//

import SwiftUI

// 32 for next practice (project 6) 

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
            Animations()
        }
    }
}
