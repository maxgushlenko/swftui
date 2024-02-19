//
//  ViewsAndModifiers.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 20/01/2024.
//

import SwiftUI

struct ButtonTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .foregroundStyle(.yellow)
            .font(.largeTitle)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 16))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(ButtonTitleModifier())
    }
}

struct MyButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(text)
                    .modifier(ButtonTitleModifier())
            }
            
            Text("Text modified via extension")
                .titleStyle()
        }
    }
}

struct ViewsAndModifiers: View {
    var body: some View {
        MyButton(text: "My button title", action: myButtonAction)
        
        Button("My Button Title") {
            print(type(of: self.body))
        }
        .padding(20)
        .background(.yellow)
        .padding(20)
        .background(.green)
        .padding(20)
        .background(.cyan)
        .padding(20)
        .background(.indigo)
    }
    
    func myButtonAction() {
        print("my button action works!")
    }
}

#Preview {
    ViewsAndModifiers()
}
