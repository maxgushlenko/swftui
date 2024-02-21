//
//  MoonshotMainView.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 21/02/2024.
//

import SwiftUI

struct MoonshotMainView: View {
    @State private var isVisible = false
    
    var body: some View {
        Form {
            Image("desktop")
                .resizable()
                .scaledToFill()
                .clipShape(.capsule)
                .padding()
                .opacity(isVisible ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true))
                .onAppear {
                    isVisible.toggle()
                }
        }
        
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) { item in
                    CustomText(text: "Item \(item)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
    }
}

struct CustomText: View {
    let text: String
    
    init(text: String) {
        print("msg___ CustomText init: \(text)")
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundStyle(.orange)
    }
}

#Preview {
    MoonshotMainView()
}
