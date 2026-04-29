//
//  CreateNewRoom.swift
//  PartyRoomDemo
//
//  Created by Christopher Walter on 4/29/26.
//

import SwiftUI
import Firebase

struct CreateNewRoomView: View {
    @State var roomName: String = ""
    
    @State var roomCode: String
    
    @State var room: Room = Room()
    @State var isRoomCreated = false
    
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
            .navigationDestination(isPresented: $isRoomCreated) {
                PlayerSignInView()
            }

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
        
    }
    
    // Add Method to save new room to Firebase!!!
    func createRoom()
    {
        room = Room(id: self.roomCode, roomName: self.roomName, created: Double(Date().timeIntervalSince1970))
        
        let theData = room.toDictionaryValues()
        
        let db = Firestore.firestore()
        db.collection("rooms").document("\(roomCode)").setData(theData) { error in
            if let err = error
            {
                print("Error in saving data: \(err)")
            }
            else {
                print("Sucessfully saved data")
                isRoomCreated.toggle() // this will trigger the navigationLink to go to SignInView
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
}

