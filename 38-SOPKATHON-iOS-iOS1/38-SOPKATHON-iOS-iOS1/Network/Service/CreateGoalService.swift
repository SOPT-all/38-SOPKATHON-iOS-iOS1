//
//  CreateGoalService.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

final class CreateGoalService {

    func createGoal(userId: Int, body: RequestCreateGoalDTO) async throws -> CreateGoalData {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw URLError(.badURL)
        }
        let endpoint = "/api/v1/\(userId)/goals"
        guard let url = URL(string: baseURL + endpoint) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("[CreateGoalService] status: \(httpResponse.statusCode)")
        }
        print("[CreateGoalService] response body: \(String(data: data, encoding: .utf8) ?? "nil")")

        let decoded = try JSONDecoder().decode(ResponseCreateGoalDto.self, from: data)
        return decoded.data
    }
}
