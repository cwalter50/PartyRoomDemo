//
//  WaitingRoomView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI
import Firebase

struct WaitingRoomView: View {
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Room Name:")
                Spacer()
                Text("FixMe")
                    .fontWeight(.bold)
                    
            }
            .font(.title)
            HStack {
                Text("Room Code:")
                Spacer()
                Text("FixMe")
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
            }
            .font(.title)
            VStack {
                Text("PLAYERS")
                    .font(.title)
                    .fontWeight(.bold)
                Divider()
                List
                {
                    let players: [Player] = [Player(), Player(), Player()]
                    ForEach(players) { player in
                        HStack {
                            Text("\(player.name)")
                            Text("\(player.id)")
                        }
                    }
                }
                .listStyle(.plain)
            }
            .padding(.top, 20)
        }
        .navigationTitle("Waiting Room")
        .padding()
        .onAppear(perform: fetchPlayersFromFirebase)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Play") {
                    // ToDo: Figure out What game to play. and how to play it...
                }.font(.title)
            }
        }
        
    }
    
    func fetchPlayersFromFirebase()
    {
        
    }
    
}

#Preview {
    NavigationStack {
        WaitingRoomView()
            .environment(GameViewModel())
//        WaitingRoomView(room: DeveloperPreview.instance.sampleRoom)
    }
}


