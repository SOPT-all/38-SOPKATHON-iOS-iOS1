//
//  RemembranceDTO.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

struct ResponseRemembranceDTO: Decodable {
    let status: Int
    let code: String
    let message: String
    let data: RemembranceDataDto
}

struct RemembranceDataDto: Decodable {
    let goalId: Int
    let title: String
    let description: String
    let owner: OwnerDTO
    let createdAt: String
    let expiredAt: String
    let condolenceCount: Int
    let condolences: [Condolence]
}

struct OwnerDTO: Decodable {
    let userId: Int
    let nickname: String
}

struct Condolence: Decodable {
    let commentId: Int
    let userId: Int
    let nickname: String
    let content: String
    let createdAt: String
}
