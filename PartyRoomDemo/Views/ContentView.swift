//
//  ContentView.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State var roomCode: String = ""
    
    @State var foundRoom = false // trigger segue to signinview
    
    @State var showErrorAlert = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack(alignment: .lastTextBaseline) {
                    TextField("Enter Room Code", text: $roomCode)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                        .textInputAutocapitalization(.characters)
                        .autocorrectionDisabled()
                    Button("Find Room") {
                        findRoomOnFirebase()
                    }
                }
                .font(.title2)
                .navigationDestination(isPresented: $foundRoom) {
                    PlayerSignInView()
                }
                
                Text("OR")
                NavigationLink("Create New Room", destination: CreateNewRoomView())
                Spacer()
            }
            .font(.largeTitle)
            .navigationTitle("Game Room Demo")
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("No room found with code: \(roomCode)"),
                    dismissButton: .default(Text("OK")){
                        roomCode = ""
                    }
                )
            }
            
        }
        .padding()
        

    }
    
    
    func findRoomOnFirebase()
    {
        
    }
}

#Preview {
    ContentView()
}
