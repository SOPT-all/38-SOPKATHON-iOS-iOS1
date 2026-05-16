//
//  HomeGoalResponseDTO.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 신서연 on 5/17/26.
//


import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status: Int
    let code: String
    let message: String
    let data: T?
}

struct HomeGoalResponseDTO: Decodable {
    let activeGoals: [HomeGoalDTO]
    let expiredGoals: [HomeGoalDTO]
    let completedGoals: [HomeGoalDTO]
}

struct HomeGoalDTO: Decodable {
    let goalId: Int
    let title: String
    let dDay: String
    let status: String
    let expiredAt: String
}
