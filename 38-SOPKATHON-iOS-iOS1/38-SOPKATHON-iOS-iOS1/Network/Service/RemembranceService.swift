//
//  RemembranceService.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

final class RemembranceService {

    func getRemembranceData(userId: Int, goalId: Int) async throws -> RemembranceDataDto {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        let endpoint = "/api/v1/\(userId)/goals/\(goalId)/funeral"
        guard let url = URL(string: baseURL + endpoint) else {
            throw NetworkError.urlError
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("[RemembranceService] status: \(httpResponse.statusCode)")
        }
        print("[RemembranceService] response body: \(String(data: data, encoding: .utf8) ?? "nil")")

        let decoded = try JSONDecoder().decode(ResponseRemembranceDTO.self, from: data)
        return decoded.data
    }
}
