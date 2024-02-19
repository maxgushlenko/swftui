//
//  ButtonAndAlert.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 18/01/2024.
//

import SwiftUI

struct ButtonAndAlert: View {
    
    @State private var showingAlert = true
    
    var body: some View {
        ZStack() {
            VStack(spacing: 0) {
                Color.blue
                Color.yellow
                LinearGradient(colors: [.pink, .indigo], startPoint: .top, endPoint: .bottom)
            }
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.purple)
                    .padding(50)
                    .background(.ultraThinMaterial)
                
                Button(action: pressMeButtonAction) {
                    Label("RIVER BUTTON", image: "river")
                        .foregroundColor(.brown)
                }
            }
        }
        .ignoresSafeArea()
        .alert("Some improtant message", isPresented: $showingAlert) {
            Button("Ok") {
                
            }
            
            Button("Close", role: .destructive) {
                
            }
        } message: {
            Text("Important message description")
        }

    }
    
    func pressMeButtonAction() {
        print("Button was pressed")
    }
}

#Preview {
    GuessTheFlag()
}
