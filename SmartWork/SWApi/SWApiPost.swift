//
//  SWApiPost.swift
//  SmartWork
//
//  Created by apple on 2017/7/2.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup

let SWApiPostProvider = MoyaProvider<SWApiPost>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

public enum SWApiPost {
    case userSocialLogin(social_type: String)
    case userAccountLogin(email: String, password: String)
}

extension SWApiPost: TargetType {
    public var baseURL: URL {
        return URL(string: baseUrlString)!
    }
    public var path: String {
        switch self {
        case .userSocialLogin:
            return "/user/social"
        case .userAccountLogin:
            return "/user"
        }
        
    }
    public var method: Moya.Method {
        return .post
    }
    public var parameters: [String: Any]? {
        var parametersDict : NSDictionary?
        
        switch self {
        case .userSocialLogin(let social_type):
            parametersDict = ["social_id" : SWUD.object(forkey: SW_TOKEN) as! String, "social_type" : social_type]
        case .userAccountLogin(let email, let password):
            parametersDict = ["email" : email, "password" : password]
        }
        return parametersDict?.getNoSignDict()
    }
    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
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




