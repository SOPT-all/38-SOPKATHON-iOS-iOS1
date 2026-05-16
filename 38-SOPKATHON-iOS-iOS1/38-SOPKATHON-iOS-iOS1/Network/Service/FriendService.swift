//
//  FriendService.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

final class FriendService {

    func getFriendData(userId: Int) async throws -> FriendDataDTO {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        let endpoint = "/api/v1/\(userId)/friends" // TODO: 엔드포인트 확인
        guard let url = URL(string: baseURL + endpoint) else {
            throw NetworkError.urlError
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("[FriendService] status: \(httpResponse.statusCode)")
        }
        print("[FriendService] response body: \(String(data: data, encoding: .utf8) ?? "nil")")

        let decoded = try JSONDecoder().decode(ResponseFriendDTO.self, from: data)
        return decoded.data
    }
}
