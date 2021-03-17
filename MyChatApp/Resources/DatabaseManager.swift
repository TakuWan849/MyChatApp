//
//  DatabaseManager.swift
//  MyChatApp
//
//  Created by 野澤拓己 on 2021/03/17.
//

import Foundation
import FirebaseDatabase

final class DatabaseManeger {
    
    static let shared = DatabaseManeger()
    private let database = Database.database().reference()
    
    public func test() {
        database.child("foo").setValue(["something": true])
    }
}

// MARK: - Account Manager
extension DatabaseManeger {
    
    
    
}
