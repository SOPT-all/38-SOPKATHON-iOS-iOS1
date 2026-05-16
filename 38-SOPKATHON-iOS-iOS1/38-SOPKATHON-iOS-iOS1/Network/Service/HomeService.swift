import Foundation

final class HomeService {

    static let shared = HomeService()

    private init() {}

    private let baseURL = Config.baseURL

    func fetchHomeGoals(
        userId: Int,
        completion: @escaping (Result<HomeGoalResponseDTO, NetworkError>) -> Void
    ) {
        guard let url = URL(string: "\(baseURL)api/v1/\(userId)/goals") else {
            completion(.failure(.urlError))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print("네트워크 에러:", error)
                completion(.failure(.unknownError))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.responseError))
                return
            }

            guard let data else {
                completion(.failure(.responseError))
                return
            }

            switch httpResponse.statusCode {
            case 200:
                do {
                    let decodedData = try JSONDecoder().decode(
                        BaseResponse<HomeGoalResponseDTO>.self,
                        from: data
                    )

                    guard let homeGoalData = decodedData.data else {
                        completion(.failure(.responseError))
                        return
                    }

                    completion(.success(homeGoalData))

                } catch {
                    print("디코딩 실패:", error)
                    completion(.failure(.responseDecodingError))
                }

            case 404:
                completion(.failure(.notFoundError))

            case 500:
                completion(.failure(.internalServerError))

            default:
                completion(.failure(.unknownError))
            }
        }.resume()
    }
}
