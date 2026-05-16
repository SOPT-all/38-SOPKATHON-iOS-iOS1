import Foundation

final class HomeService {

    static let shared = HomeService()

    private init() {}

    func fetchHomeGoals(
        userId: Int,
        completion: @escaping (Result<[HomeGoalDTO], NetworkError>) -> Void
    ) {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            completion(.failure(.urlError))
            return
        }
        guard let url = URL(string: "\(baseURL)/api/v1/\(userId)/goals") else {
            completion(.failure(.urlError))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        print("[HomeService] 요청 URL: \(url)")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print("[HomeService] 네트워크 에러:", error)
                completion(.failure(.unknownError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("[HomeService] 응답 파싱 실패")
                completion(.failure(.responseError))
                return
            }

            print("[HomeService] status: \(httpResponse.statusCode)")

            guard let data else {
                print("[HomeService] data nil")
                completion(.failure(.responseError))
                return
            }

            print("[HomeService] response body: \(String(data: data, encoding: .utf8) ?? "nil")")

            switch httpResponse.statusCode {
            case 200:
                do {
                    let decodedData = try JSONDecoder().decode(
                        BaseResponse<[HomeGoalDTO]>.self,
                        from: data
                    )

                    guard let homeGoalData = decodedData.data else {
                        print("[HomeService] data 필드 nil")
                        completion(.failure(.responseError))
                        return
                    }

                    print("[HomeService] 디코딩 성공 - 목표 수: \(homeGoalData.count)")
                    completion(.success(homeGoalData))

                } catch {
                    print("[HomeService] 디코딩 실패:", error)
                    completion(.failure(.responseDecodingError))
                }

            case 404:
                print("[HomeService] 404 Not Found")
                completion(.failure(.notFoundError))

            case 500:
                print("[HomeService] 500 Internal Server Error")
                completion(.failure(.internalServerError))

            default:
                print("[HomeService] 예상치 못한 status: \(httpResponse.statusCode)")
                completion(.failure(.unknownError))
            }
        }.resume()
    }
}
