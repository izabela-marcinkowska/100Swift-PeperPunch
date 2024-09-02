//
//  ContentView.swift
//  PaperPunch
//
//  Created by Izabela Marcinkowska on 2024-09-02.
//

import SwiftUI

struct ContentView: View {
    let choices = ["scissors", "papper", "rock"]
    @State var userChoice = ""
    
    var body: some View {
        VStack {
            Button {
                userChoice = "scissors"
            } label: {
                Text("scissors")
            }
            Button {
                userChoice = "paper"
            } label: {
                Text("paper")
            }
            Button {
                userChoice = "rock"
            } label: {
                Text("rock")
            }
            
            Text("Computer Choice is \(getComputerChoice(choices))")
            Text("User Choice is \(userChoice)")
        }
    }
}

func getComputerChoice (_ choices: [String]) -> String {
    choices.randomElement()!
}

#Preview {
    ContentView()
}
