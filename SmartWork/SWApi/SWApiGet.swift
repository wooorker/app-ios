//
//  SWApi.swift
//  SmartWork
//
//  Created by apple on 2017/6/11.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let SWApiGetProvider = MoyaProvider<SWApiGet>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum SWApiGet {
    case test
}

extension SWApiGet: TargetType {
    public var baseURL: URL { return URL(string: "http://api.tigerb.cn/v1")! }
    public var path: String {
        switch self {
        case .test:
            return "/user"
        }
    }
    public var method: Moya.Method {
        return .post
    }
    public var parameters: [String: Any]? {
        var parametersDict : NSDictionary?
        
        switch self {
        case .test:
            parametersDict = ["email" : "tigerbcode@gmail.com", "password" : "123456"]
            return parametersDict?.getSignDict();
        
        }
    }
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var task: Task {
        return .request
    }
    public var validate: Bool {
        return true
    }
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

//MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}




