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
                FlagImage(picture: "scissors-user").shadow(color: (userChoice + "-user" == "scissors-user" ? .green : .black), radius: 10)
            }
            HStack {
                
            Button {
                userChoice = "paper"
                computersChoice = getComputerChoice(choices)
                playGame(choice: userChoice, computersChoice: computersChoice, round: roundNumber)
            } label: {
                FlagImage(picture: "paper-user").shadow(color: (userChoice + "-user" == "paper-user" ? .green : .black), radius: 10)
            }
            Button {
                userChoice = "rock"
                computersChoice = getComputerChoice(choices)
                playGame(choice: userChoice, computersChoice: computersChoice, round: roundNumber)
            } label: {
                FlagImage(picture: "rock-user").shadow(color: (userChoice + "-user" == "rock-user" ? .green : .black), radius: 10)
            }
            }
            
            Text("Computer Choice is:")
            FlagImage(picture: computersChoice + "-computer")
        
            if (result == "tie") {
                Text("Tie").foregroundStyle(.orange).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            } else if (result == "win") {
                Text("Win").foregroundStyle(.green).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            } else if (result == "loose") {
                Text("Lose").foregroundStyle(.red).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
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
            result = "loose"
        } else if (choice == "paper" && computersChoice == "rock") {
            result = "win"
        } else if (choice == "scissors" && computersChoice == "rock") {
            result = "loose"
        } else if (choice == "rock" && computersChoice == "scissors") {
            result = "win"
        } else if (choice == "paper" && computersChoice == "scissors") {
            result = "loose"
        } else if (choice == "scissors" && computersChoice == "paper") {
            result = "win"
        } else {
            result = "tie"
        }
        roundNumber += 1
        if (roundNumber == 10) {
            showingAlert = true
            roundNumber = 1
        }
    }
    struct FlagImage: View {
        var picture: String
        var body: some View {
            Image(picture)
                .resizable()
                .frame(width: 160.0, height: 150.0)
                .shadow(radius: 5)
        }
    }
    
    var tie: some View {
        Text("Tie").foregroundStyle(.black).font(.title)
    }
    


}

func getComputerChoice (_ choices: [String]) -> String {
    choices.randomElement()!
}


#Preview {
    ContentView()
}
