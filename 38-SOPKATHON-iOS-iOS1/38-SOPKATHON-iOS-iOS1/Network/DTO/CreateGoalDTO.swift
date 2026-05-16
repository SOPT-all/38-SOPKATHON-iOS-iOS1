//
//  CreateGoalDTO.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

struct RequestCreateGoalDTO: Encodable {
    let title: String
    let expiredAt: String
}

struct ResponseCreateGoalDto: Decodable {
    let status: Int
    let code: String
    let message: String
    let data: CreateGoalData
}

struct CreateGoalData: Decodable {
    let goldId: Int
    let title: String
    let createdAt: String
    let updatedAt: String
    let expiredAt: String
}
