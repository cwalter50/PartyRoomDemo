//
//  CreateNewRoom.swift
//  PartyRoomDemo
//
//  Created by Christopher Walter on 4/29/26.
//

import SwiftUI
import Firebase

struct CreateNewRoomView: View {
    
    @Environment(GameViewModel.self) var vm: GameViewModel
    
    @State var roomName: String = ""
    
    @State var roomCode: String
    
    @State var isRoomCreated = false
    
    @State var showErrorAlert: Bool = false
    @State var errorMessage: String = ""
    
    init()
    {
        let uuid = UUID().uuidString
        let index = uuid.index(uuid.startIndex, offsetBy: 6)
        roomCode = String(uuid[..<index])
    }
        
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Room Name: ")
                TextField("Enter Room Name", text: $roomName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .font(.body)
            }
            HStack {
                Text("Room Code: ")
                Spacer()
                Text(roomCode)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                Button {
                    getNewRoomCode()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
            .navigationDestination(isPresented: $isRoomCreated, destination: {
                PlayerSignInView()
            })
            
            Button("Create Room")
            {
                createRoom()
            }
            .disabled(roomName == "")
            
            Spacer()

        }
        .padding()
        .font(.title)
        .navigationTitle("Create New Room")
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Error"),
                message: Text("\(errorMessage)"),
                dismissButton: .default(Text("OK")){
                    errorMessage = ""
                }
            )
        }
    }
    
    // Add Method to save new room to Firebase!!!
    func createRoom()
    {
        Task {
            let result = try await vm.createRoomInFirestore(roomId: roomCode, roomName: roomName)
            if let err = result {
                print("DEBUG: Failed to create room in Firestore \(err.localizedDescription)")
            } else {
                isRoomCreated = true // trigger naviagtion to playersignin
            }
        }
        
    }
    
    func getNewRoomCode()
    {
        let uuid = UUID().uuidString
        let index = uuid.index(uuid.startIndex, offsetBy: 6)
        roomCode = String(uuid[..<index])
    }
}

#Preview {
    NavigationStack {
        CreateNewRoomView()
    }
    .environment(GameViewModel())
}

