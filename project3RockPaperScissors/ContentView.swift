//
//  ContentView.swift
//  project3RockPaperScissors
//
//  Created by Student on 10/18/24.
//

import SwiftUI
import SwiftData

struct ContentView {
    @State private var options = ["🪨", "✂️", "📑"]
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @State private var randomIndex = Int.random(in: 0...2)
    var body: some View {
        VStack {
            Spacer()
            Text("rock Paper Scissors")
                .font(.largeTitle)
                .bold()
            VStack {
                VStack {
                    Text("Select")
                        .font(.title)
                        .foregroundStyle(.white)
                    Text(options[randomIndex])
                        .font(.system(size: 100))
                }
                HStack {
                    ForEach(0..<3){ number in
                        Button {
                            
                        } label: {
                            Text(options[number])
                                .font(.system(size: 75))
                        }
                    }
                }
            }
            .padding(20)
            .background(.gray)
            .cornerRadius(25)
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("proceed", action: reload)
        }
    }
    func optionTapped(_ num: Int) {
        if num - 1 == randomIndex || num +2 == randomIndex {
            alertMessage = "correct"
        } else {
            alertMessage = "wrong"
        }
        showAlert = true
    }
    func reload() {
        randomIndex = Int.random(in: 0...2)
    }
}
#Preview {
    ContentView()
}
