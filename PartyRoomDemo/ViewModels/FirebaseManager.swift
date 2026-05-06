//
//  FirebaseService.swift
//  PartyRoomDemo
//
//  Created by Christopher Walter on 4/29/26.
//

import Firebase
import SwiftUI
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    
    let db = Firestore.firestore()
    
    
    
    func createRoomInFirestore(room: Room) async throws -> Error?{
        do {
            try await db.collection("rooms").document(room.id).setData(room.toDictionaryValues())
            return nil
        } catch {
            print("DEBUG: Error Writing room to FireStore: \(error)")
            return error
        }
    }
    
    func loadRoomFromFirebase(id: String) async throws -> Room? {
//        do {
//            let result = try await db.collection("rooms").document(id).getDocument()
//            let room = Room(snapshot: result)
//            return room
//        } catch {
//            print("Error Loading Room From FireStore: \(error)" )
//            return nil
//        }
        return nil
    }
}
