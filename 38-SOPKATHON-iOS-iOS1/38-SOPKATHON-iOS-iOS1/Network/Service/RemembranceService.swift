//
//  RemembranceService.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

final class RemembranceService {

    private let baseURL = "" // TODO: Config에서 설정

    func getRemembranceData(userId: Int, goalId: Int) async throws -> RemembranceDataDto {
        let endpoint = "/api/v1/\(userId)/goals/\(goalId)/funeral"
        guard let url = URL(string: baseURL + endpoint) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(ResponseRemembranceDTO.self, from: data)
        return decoded.data
    }
}
