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
    
    var body: some View {
        VStack {
            Button {
                userChoice = "scissors"
                playGame(choice: userChoice)
            } label: {
                Text("scissors")
            }
            Button {
                userChoice = "paper"
                playGame(choice: userChoice)
            } label: {
                Text("paper")
            }
            Button {
                userChoice = "rock"
                playGame(choice: userChoice)
            } label: {
                Text("rock")
            }
            
            Text("Computer Choice is \(getComputerChoice(choices))")
            Text("User Choice is \(userChoice)")
            Text("Result \(result)")
            Button {
                userChoice = ""
            } label: {
                Text("play again")
            }
        }
    }
    func playGame (choice: String) -> Void {
        var computersChoice = getComputerChoice(choices)
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
    }

}

func getComputerChoice (_ choices: [String]) -> String {
    choices.randomElement()!
}


#Preview {
    ContentView()
}
