//
//  GameViewModel.swift
//  PartyRoomDemo
//
//  Created by Christopher Walter on 4/29/26.
//


import SwiftUI
import Firebase
import FirebaseFirestore

@Observable
class GameViewModel {
    
    var room: Room = Room()
    
    
    func loadRoomFromFirestore(roomCode: String) async throws -> Bool {
        
        let db = Firestore.firestore()
        do {
            let result = try await db.collection("rooms").document(roomCode).getDocument()
            if let data = result.data() {
                let roomName = data["roomName"] as? String ?? "No Name"
                let roomId = data["id"] as? String ?? "No ID"
                let created = data["created"] as? Double ?? 0
                
                self.room = Room(id: roomId, roomName: roomName, created: created)
                
                return true
            } else {
                return false
            }
            
        } catch {
            print("DEBUG: Error is getting room: \(error.localizedDescription)")
        }
        
        return false
    }
    
    func createRoomInFirestore(roomId:String, roomName: String) async throws -> Error?{
        // create room locally
        
        self.room = Room(id: roomId, roomName: roomName)
        
        let db = Firestore.firestore()
        
        do {
            try await db.collection("rooms").document(roomId).setData(room.toDictionaryValues())
        } catch {
            print("DEBUG: Error creating room in Firestore: \(error.localizedDescription)")
            return error
        }
        
        return nil
    }
    
    
    func createPlayerInFirestore(roomId:String, player: Player) async throws -> Error?{
        // create room locally
        
        
        
        let db = Firestore.firestore()
        
        do {
            try await db.collection("rooms").document(roomId).collection("players").document(player.id).setData(player.toDictionaryValues())
        } catch {
            print("DEBUG: Error creating room in Firestore: \(error.localizedDescription)")
            return error
        }
        
        return nil
    }
    
    // ToDo: Get this to work.
    func listentoChangesToRoom(room: Room) {
        let db = Firestore.firestore()
        
        do {
            db.collection("roome").document(room.id).collection("players").addSnapshotListener { snapshots, error in
                if let err = error {
                    print("DEBUG: Error listening to players: \(err.localizedDescription)")
                }
                if let snapshots = snapshots {
                    for snap in snapshots.documents {
                        
                    }
                }
                
            }
        }
    }
    
    
}
