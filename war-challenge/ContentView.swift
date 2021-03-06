//
//  ContentView.swift
//  war-challenge
//
//  Created by Dharamveer Gupta on 31/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    @State private var currentLevel = 0
    @State private var maxReached = false
    
    var body: some View {
        
        ZStack {
            Image("background").ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    let playerRnd = Int.random(in: 2...14)
                    let cpuRnd = Int.random(in: 2...14)
                    playerCard = "card" + String(playerRnd)
                    cpuCard = "card" + String(cpuRnd)
                    
                    if playerRnd > cpuRnd {
                        playerScore += 1
                    } else if playerRnd < cpuRnd {
                        cpuScore += 1
                    }
                    
                    if currentLevel < 50 && maxReached == false {
                        increase()
                    } else if maxReached == true && currentLevel > 0 {
                        decrease()
                    } else if currentLevel >= 50 {
                        maxReached = true
                    } else if currentLevel <= 0 {
                        maxReached = false
                    }
                    
                } label: {
                    Image("dealbutton")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").font(.headline).padding(.bottom, 10)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU").font(.headline).padding(.bottom, 10)
                        Text(String(cpuScore)).font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(Color.white)
                
                VStack {
                    Text("Climb/Drop").font(.headline)
                    Text(String(currentLevel)).font(.largeTitle)
                }
                Spacer()
            }.padding()
        }
    }
    
    func increase() {
        currentLevel += Int.random(in: 1...10)
    }
    
    func decrease() {
        currentLevel -= Int.random(in: 1...10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
