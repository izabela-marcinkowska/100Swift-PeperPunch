//
//  ContentView.swift
//  PaperPunch
//
//  Created by Izabela Marcinkowska on 2024-09-02.
//

import SwiftUI

struct ContentView: View {
    let choices = ["scissors", "papper", "rock"]

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(getComputerChoice(choices))
        }
        .padding()
    }
}

func getComputerChoice (_ choices: [String]) -> String {
    choices.randomElement()!
}

#Preview {
    ContentView()
}
