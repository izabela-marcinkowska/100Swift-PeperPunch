//
//  ContentView.swift
//  PaperPunch
//
//  Created by Izabela Marcinkowska on 2024-09-02.
//

import SwiftUI

let choices = ["scissors", "paper", "rock"]
var result = ""
struct ContentView: View {
    @State private var userChoice = ""
    @State private var computersChoice = ""
    @State private var roundNumber = 1
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button {
                userChoice = "scissors"
                computersChoice = getComputerChoice(choices)
                playGame(choice: userChoice, computersChoice: computersChoice, round: roundNumber)
                
            } label: {
                Text("scissors")
            }
            Button {
                userChoice = "paper"
                computersChoice = getComputerChoice(choices)
                playGame(choice: userChoice, computersChoice: computersChoice, round: roundNumber)
            } label: {
                Text("paper")
            }
            Button {
                userChoice = "rock"
                computersChoice = getComputerChoice(choices)
                playGame(choice: userChoice, computersChoice: computersChoice, round: roundNumber)
            } label: {
                Text("rock")
            }
            
            Text("Computer Choice is \(computersChoice)")
            Text("User Choice is \(userChoice)")
            Text("Result \(result)")
            Text("Round \(roundNumber)")
            Button {
                userChoice = ""
                computersChoice = ""
                roundNumber = 1
            } label: {
                Text("play again")
            }
        }.alert("End of game", isPresented: $showingAlert) {
            Button("Ok") {}
        }
    }
    func playGame (choice: String, computersChoice: String, round: Int) -> Void {
        if (choice == "rock" && computersChoice == "paper") {
            result = "you loose"
        } else if (choice == "paper" && computersChoice == "rock") {
            result = "you win"
        } else if (choice == "scissors" && computersChoice == "rock") {
            result = "you loose"
        } else if (choice == "rock" && computersChoice == "scissors") {
            result = "you win"
        } else if (choice == "paper" && computersChoice == "scissors") {
            result = "you loose"
        } else if (choice == "scissors" && computersChoice == "paper") {
            result = "you win"
        } else {
            result = "tie"
        }
        roundNumber += 1
        if (roundNumber == 10) {
            showingAlert = true
            roundNumber = 1
        }
    }

}

func getComputerChoice (_ choices: [String]) -> String {
    choices.randomElement()!
}


#Preview {
    ContentView()
}
