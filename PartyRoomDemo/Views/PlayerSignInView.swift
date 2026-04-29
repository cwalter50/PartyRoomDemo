//
//  SignInView.swift
//  PartyRoomDemo
//
//  Created by Christopher Walter on 4/29/26.
//


import SwiftUI
import Firebase

struct PlayerSignInView: View {
    

    @State var playerName: String = ""
    @State var isPlayerSaved = false

    var body: some View {
        VStack {
            Text("Room Name:")
                .font(.largeTitle)
            HStack {
                Text("Room Code:")
                Spacer()
                Text("FixMe")
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
            }
            .font(.title)
            HStack {
                Text("Your Name: ")
                    .font(.title)
                TextField("Enter Your Name", text: $playerName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .font(.body)
            }
            Button("Join Room")
            {
                addPlayerToRoom()
            }
            .font(.largeTitle)
            .disabled(playerName == "")
            .navigationDestination(isPresented: $isPlayerSaved) {
                WaitingRoomView()
            }
            
            Spacer()
        }
        .padding()
        
    }
    
    
    func addPlayerToRoom()
    {
        
    }
}

#Preview{
    PlayerSignInView()
}


