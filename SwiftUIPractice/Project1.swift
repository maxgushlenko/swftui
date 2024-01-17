//
//  Project1.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 16/01/2024.
//

import SwiftUI

struct Project1: View {
    let students = ["Mike", "Ciao", "Ron"]
    
    @State private var tapCount = 0
    @State private var textFieldResult = ""
    @State private var selectedStudent = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $textFieldResult)
                Text("You wrote: \(textFieldResult)")
                
                Button("Press me") {
                    tapCount += 1
                    print(tapCount, textFieldResult)
                }
            }
            
            Form {
                Picker("Select student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            .navigationTitle("Project 1")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Project1()
}
