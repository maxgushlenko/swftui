//
//  PaperScissorsRock.swift
//  SwiftUIPractice
//
//  Created by Maksym Hushlenko on 31/01/2024.
//

import SwiftUI

struct PaperScissorsRock: View {
    enum GameState {
        case idle
        case win
        case lose
        case draw
        case finish
    }
    
    @State private var gameState: GameState = .idle {
        didSet { updateUI() }
    }
    @State private var matchNumber = 0
    @State private var mainTitle = "Chose the move"
    @State private var matchResult = ""
    
    @State private var userScore = 0
    @State private var computerScore = 0
    @State private var showResetButton = false
    
    private var moves: [String] = ["Rock", "Paper", "Scissors"]
    private var winningMoves: [String] = ["Paper", "Scissors", "Rock"]
    private var maxMatchesNumber = 3
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(mainTitle)
            
            HStack {
                Text("Computer score: \(computerScore)")
                Spacer()
                Text("User score: \(userScore)")
            }
            .padding()
            
            Text(matchResult)
            
            Spacer()
            
            if showResetButton {
                Button("Play Again") {
                    showResetButton = false
                    gameState = .idle
                }
            } else {
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button(move) {
                            compare(userMove: move, computerMove: moves.randomElement()!)
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
    
    func updateUI() {
        switch gameState {
        case .idle:
            mainTitle = "Chose the move"
            userScore = 0
            computerScore = 0
            matchNumber = 0
            matchResult = ""
        case .win:
            break
        case .lose:
            break
        case .draw:
            break
        case .finish:
            if userScore > computerScore {
                matchResult = "User win!"
            } else if computerScore > userScore {
                matchResult = "Computer win!"
            } else {
                matchResult = "Draw!"
            }
            
            mainTitle = "Press Play button to begin the game"
            showResetButton = true
        }
    }
    
    func compare(userMove: String, computerMove: String) {
        guard
            let userMoveIndex = moves.firstIndex(of: userMove),
            let computerMoveIndex = moves.firstIndex(of: computerMove),
            let computerWinningMoveIndex = winningMoves.firstIndex(of: computerMove),
            let userWinningMoveIndex = winningMoves.firstIndex(of: userMove)
        else { return }
        
        matchResult = userMove + " vs " + computerMove
        
        if userMoveIndex == computerMoveIndex {
            gameState = .draw
        } else if computerWinningMoveIndex == userMoveIndex {
            computerScore += 1
            gameState = .lose
        } else if userWinningMoveIndex == computerMoveIndex {
            userScore += 1
            gameState = .win
        }
        
        matchNumber += 1
        
        if matchNumber == maxMatchesNumber {
            gameState = .finish
            matchNumber = 0
        }
    }
}

#Preview {
    PaperScissorsRock()
}
