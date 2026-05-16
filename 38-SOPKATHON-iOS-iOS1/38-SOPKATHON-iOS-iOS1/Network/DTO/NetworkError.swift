//
//  NetworkError.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import Foundation

enum NetworkError: Int, Error, CustomStringConvertible {
    var description: String {
        self.errorDescription
    }
    case requestEncodingError
    case responseDecodingError
    case responseError
    case urlError
    case unknownError
    case loginFailed = 400
    case internalServerError = 500
    case notFoundError = 404
    
    var errorDescription: String {
        switch self {
        case .loginFailed: return "잘못된 입력입니다."
        case .requestEncodingError: return "REQUEST_ENCODING_ERROR"
        case .responseError: return "RESPONSE_ERROR"
        case .urlError: return "URL_ERROR"
        case .responseDecodingError: return "RESPONSE_DECODING_ERROR"
        case .unknownError: return "UNKNOWN_ERROR"
        case .internalServerError: return "서버 오류가 발생했습니다."
        case .notFoundError: return "리소스를 찾을 수 없습니다."
        }
    }
}
