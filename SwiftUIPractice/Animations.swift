//
//  Animations.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 19/02/2024.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -180, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct Animations: View {
    @State private var animationAmount = 1.0
    @State private var animationRotate = 0.0
    @State private var enabled = false
    @State private var isShowRectangle = false
    @State private var isShowingRed = false
    
    var body: some View {
        // MARK: -
        
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.indigo)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: animationAmount) // here
        )
        .onAppear {
            animationAmount = 2
        }
        
        VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(.bouncy(duration: 1).repeatCount(3, autoreverses: true)), in: 1...10) // here
            
            Spacer()
            
            // MARK: -
            
            Button("Tap Me 2") {
                animationAmount += 1
            }
            .padding(40)
            .background(.pink)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .scaleEffect(animationAmount)
//            .animation(.bouncy(duration: 1), value: animationAmount) // here
            
            Spacer()
            
            // MARK: -
            
            Button("Tap Me 3") {
                withAnimation(.spring(duration: 2).repeatCount(2, autoreverses: true)) {
                    animationRotate += 180
                }
            }
            .padding(40)
            .background(.yellow)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .rotation3DEffect(
                .degrees(animationRotate), axis: (x: 1.0, y: 1.0, z: 0.0)
            )
            
            Spacer()
            
            // MARK: -
            
            Button("Tap me 4") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .cyan : .gray)
            .foregroundStyle(.white)
            .animation(.easeInOut(duration: 1), value: enabled)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.easeInOut(duration: 5), value: enabled)
            
            Spacer()
            
            // MARK: -
            
            Button("Tap me 5") {
                withAnimation {
                    isShowRectangle.toggle()
                }
            }
            .frame(width: 200, height: 100)
            .background(.orange)
            .foregroundStyle(.white)
            
            if isShowRectangle {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .transition(.scale)
            }
            
            // MARK: -
            
            ZStack {
                Rectangle()
                    .fill(.black)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
        }
    }
}

#Preview {
    Animations()
}
