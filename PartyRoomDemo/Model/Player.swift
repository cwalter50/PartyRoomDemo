

//
//  Player.swift
//  GameRoomDemo
//
//  Created by Christopher Walter on 3/5/23.
//

import Foundation
import SwiftUI

class Player: Identifiable {
    var id: String
    var name: String
    var created: Double
    
    init (id: String = UIDevice.current.identifierForVendor?.uuidString ?? "No  Device ID Found", name: String = "Dr. Peterson", created: Double = Double(Date().timeIntervalSince1970)) {
        self.id = id
        self.name = name
        self.created = created
    }
    
    // great for saving data into Firebase
    func toDictionaryValues() -> [String: Any]
    {
        return ["id": self.id, "name": self.name, "created": self.created]
    }
    
    
}

//class Player: ObservableObject, Identifiable
//{
//    @Published var id: String
//    @Published var name: String
//    @Published var created: Double // this is the date the player was created
//    
//    init(id: String = UIDevice.current.identifierForVendor?.uuidString ?? "No  Device ID Found", name: String = "Dr. Peterson", created: Double = Double(Date().timeIntervalSince1970))
//    {
//        self.id = id
//        self.name = name
//        self.created = created
//    }
//    
//    func toDictionaryValues() -> [String: Any]
//    {
//        return ["id": self.id, "name": self.name, "created": self.created]
//    }
//}
