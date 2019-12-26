//
//  Response.swift
//  ios
//
//  Created by Marco Valentino on 2019/12/26.
//  Copyright © 2019 Marco Valentino. All rights reserved.
//

import Foundation
import common

public enum Response<T> {
    case loading
    case success(data: T)
    case error(error: ErrorEntity)
}

extension Result {
    func toResponse<T>() -> Response<T> {
        switch self {
        case let result as Result.Success:
            return .success(data: result.data as! T)
        case let result as Result.Error:
            return .error(error: result.error)
        default:
            return .loading
        }
    }
}
