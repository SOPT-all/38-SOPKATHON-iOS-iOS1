//
//  FriendDTO.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

struct ResponseFriendDTO: Decodable {
    let status: Int
    let code: String
    let message: String
    let data: FriendDataDTO
}

struct FriendDataDTO: Decodable {
    let friendId: Int
    let nickname: String
    let friendshipId: Int
    let createdAt: String
}
