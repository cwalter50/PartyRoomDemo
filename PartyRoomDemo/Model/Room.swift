//
//  Room.swift
//  PartyRoomDemo
//
//  Created by Christopher Walter on 4/29/26.
//
import SwiftUI
import FirebaseFirestore


class Room: Identifiable, Codable {
    var id: String
    var roomName: String
    var created: Double
    var players: [Player]
    
    init(id: String = "ABCDEF", roomName: String = "Avengers", players: [Player] = [], created: Double = Double(Date().timeIntervalSince1970)) {
        self.id = id
        self.roomName = roomName
        self.created = created
        self.players = players
    }
    
    func toDictionaryValues() -> [String: Any]
    {
        return ["roomName": self.roomName, "roomCode": self.id, "created": self.created]
    }
    
    
}

//class Room: Identifiable
//{
//    var id: String // This is the roomCode
//    var roomName: String
//    var created: Double // this is the time the room was created. Can use this to sort, if we display different rooms...
//    var players: [Player] // a player contains a device id that links them to a name
//    
//    init(id: String = "ABCDEF", roomName: String = "Avengers", players: [Player] = [], created: Double = Double(Date().timeIntervalSince1970)) {
//        self.id = id
//        self.roomName = roomName
//        self.players = players
//        self.created = created
//    }
//    
//    func toDictionaryValues() -> [String: Any]
//    {
//        return ["roomName": self.roomName, "roomCode": self.id, "created": self.created]
//    }
//    
//    
//}

