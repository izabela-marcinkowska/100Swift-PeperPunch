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
    @State private var points = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(roundNumber)/10").padding(.top, 20).font(.title)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea()
            .padding(.leading, 45)
        
        VStack {
            Spacer()
            Spacer()
            VStack{
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
                Spacer()
            }
            Spacer()
            VStack {
                if (result == "tie") {
                    Text("Tie").foregroundStyle(.orange).font(.largeTitle)
                } else if (result == "win") {
                    Text("Win").foregroundStyle(.green).font(.largeTitle)
                } else if (result == "loose") {
                    Text("Lose").foregroundStyle(.red).font(.largeTitle)
                } else {
                    Text("Result").foregroundStyle(.gray).font(.largeTitle)
                }
                Text("Points: \(points)").font(.title3)
                Text("Computer chooses:").font(.title2).italic()
                Spacer()
                FlagImage(picture: computersChoice + "-computer")
                
                Spacer()
                Button {
                    userChoice = ""
                    computersChoice = ""
                    roundNumber = 1
                } label: {
                    Text("Try again")
                }
            }
        }.alert("End of game", isPresented: $showingAlert) {
            Button("Try again"){
                resetPoints()
            }
        } message: {
            Text("You got \(points) points")
        }
        
    }
    func playGame (choice: String, computersChoice: String, round: Int) -> Void {
        if (choice == "rock" && computersChoice == "paper") {
            result = "loose"
        } else if (choice == "paper" && computersChoice == "rock") {
            result = "win"
            points += 1
        } else if (choice == "scissors" && computersChoice == "rock") {
            result = "loose"
        } else if (choice == "rock" && computersChoice == "scissors") {
            result = "win"
            points += 1
        } else if (choice == "paper" && computersChoice == "scissors") {
            result = "loose"
        } else if (choice == "scissors" && computersChoice == "paper") {
            result = "win"
            points += 1
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
        Text("Tie").foregroundStyle(.black).font(.largeTitle)
    }
    
    func resetPoints () -> Void {
        points = 0
    }
    
    
}

func getComputerChoice (_ choices: [String]) -> String {
    choices.randomElement()!
}


#Preview {
    ContentView()
}
