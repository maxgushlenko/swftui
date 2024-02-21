//
//  iExpenseMainView.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 19/02/2024.
//

import Observation 
import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct iExpenseMainView: View {
    @State private var user = User()
    @State private var showGreatingsSheetView = false
    
    var body: some View {
        List {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName)")
                TextField("First name", text: $user.firstName)
                    .padding()
                TextField("Last name", text: $user.lastName)
                    .padding()
                
                Button("Show greatings view") {
                    showGreatingsSheetView.toggle()
                }
                .sheet(isPresented: $showGreatingsSheetView) {
                    SheetView(greatingName: user.firstName)
                }
            }
        }
        
        List {
            ExpensesAppView()
        }
    }
}

struct SheetView: View {
    @AppStorage("last name") var lastName = ""
    @Environment(\.dismiss) var dismiss
    
    let greatingName: String
    
    var body: some View {
        VStack {
            Text("Hello, \(greatingName)")
                .padding()
            
            if !lastName.isEmpty {
                Text("Last time i greated \(lastName)")
                    .padding()
            }
            
            Button("Dismiss") {
                lastName = greatingName
                dismiss()
            }
            .padding()
        }
    }
}

#Preview {
    iExpenseMainView()
}
