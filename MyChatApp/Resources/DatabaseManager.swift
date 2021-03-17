//
//  DatabaseManager.swift
//  MyChatApp
//
//  Created by 野澤拓己 on 2021/03/17.
//

import Foundation
import FirebaseDatabase

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let email: String
    
    var safeEmail: String {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        return safeEmail
    }
}

final class DatabaseManeger {
    
    static let shared = DatabaseManeger()
    private let database = Database.database().reference()
    
    static func safeEmail(emailAdress: String) -> String {
        var safeEmail = emailAdress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        return safeEmail
    }
    
}

// MARK: - Account Manager
extension DatabaseManeger {
    
    // ユーザがすでに存在しているどうか判定する処理
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        // completionクロージャで成功したかどうかの判定を送り、送った先で処理を記述させる高等テク
        // 受け取ったemailアドレスを読み込める形に変換する
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value != nil else {
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    // Firebasedatabaseにユーザを追加する処理
    public func insertUser(with user: ChatAppUser, completion: @escaping ((Bool) -> Void)) {
        
        database.child(user.safeEmail).setValue([
            
            "first_name": user.firstName,
            "last_name": user.lastName
            
        ], withCompletionBlock: { (error, referense) in
            
            guard error == nil else {
                print("databaseへの書き込みに失敗しました。")
                completion(false)
                return
            }
            // 書き込まれたデータの読み込みをして, 新しいCollectionの作成を行う処理
            self.database.observeSingleEvent(of: .value, with: {(snapshot) in
                if var userCollection = snapshot.value as? [[String : String]] {
                    // snapshotの中身が存在したとき, userCollectionにinsertしたユーザの情報を入れる
                    let newElement = [
                        "name": user.firstName + " " + user.lastName,
                        "email": user.safeEmail
                    ]
                    userCollection.append(newElement)
                    
                    // userCollectionをdatabaseに保存する処理
                    self.database.child("users").setValue(userCollection) { (error, referense) in
                        guard error == nil else {
                            completion(false)
                            return
                        }
                        
                        completion(true)
                    }
                    
                }
                else {
                    // snapshotの中身が空だったとき, newCollecionを作成する：databaseの中身が空のときに呼ばれる
                    let newCollection: [[String: String]] = [
                        [
                            "name": user.firstName + " " + user.lastName,
                            "email": user.safeEmail
                        ]
                    ]
                    
                    // databaseに構造を保存する
                    self.database.child("users").setValue(newCollection) { (error, referense) in
                        guard error == nil else {
                            completion(false)
                            return
                        }
                        
                        completion(true)
                    }
                    
                }
            })
            
            // databaseの書き込みに成功しました。
            completion(true)
        })
    }
    
    // すべてのユーザを取り出す処理
//    public func getAllUsers()
}


