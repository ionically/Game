//
//  ContentView.swift
//  Game
//
//  Created by chandni chaudhari on 27/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var cpuCard = "card"
    @State private var playerCard = "card"
    @State private var cpuScore = 0
    @State private var playerScore = 0
    @State var counter = ("")
    @State var counter1 = (" Player Name :")
    @State var winnerName = "-- WINNER NAME --"
    
    var body: some View {
        VStack {
            Image("monster")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .padding()
            Spacer()
            Image("background")
                .foregroundColor(.red)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Image(playerCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(cpuCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                .background(Color(.lightGray))
                Button(action: {
                    winnerName = "-- WINNER NAME --"
                    let playerRandom = Int.random(in: 1...14)
                    let cpuRandom = Int.random(in: 1...14)
                    
                    playerCard = "card" + String(playerRandom)
                    cpuCard = "card" + String(cpuRandom)
                    
                    
                    if playerRandom < cpuRandom {
                        playerScore += 1
                    }else if cpuRandom < playerRandom {
                        cpuScore += 1
                    }
                    
                },label: {
                    HStack{
                        VStack {
                            Spacer()
                            Image("LOGO")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("Player")
                            Text(String(playerScore))
                                .imageScale(.large)
                                .fixedSize()
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .font(.title)
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            Text("CPU")
                            Text(String(cpuScore))
                                .imageScale(.large)
                                .fixedSize()
                                .foregroundColor(.black)
                                .font(.largeTitle)
                            Spacer()
                        }
                    }
                })
                Spacer()
                Button(action: {
                    if playerScore > cpuScore {
                        winnerName = "Player WON".uppercased()
                    } else if cpuScore > playerScore {
                        winnerName = "cpu WON".uppercased()
                    } else {
                        winnerName = "draw".uppercased()
                    }
                }, label: {
                    Text("DONE")
                        .imageScale(.large)
                        .fixedSize()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .font(.title)
                })
                Spacer()
                Text(winnerName)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
        .background(Color(.red))
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
