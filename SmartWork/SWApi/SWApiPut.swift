//
//  SWApiPut.swift
//  SmartWork
//
//  Created by apple on 2017/7/2.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import Foundation

import Moya

// MARK: - Provider setup

let SWApiPutProvider = MoyaProvider<SWApiPut>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

public enum SWApiPut {
    case updateUser(username: String?, email: String?, password: String?, newpassword: String?, avatar: String?)
}

extension SWApiPut: TargetType {
    public var baseURL: URL {
        return URL(string: baseUrlString)!
    }
    public var path: String {
        switch self {
        case .updateUser:
            return "/user"
        }
        
    }
    public var method: Moya.Method {
        return .put
    }
    public var parameters: [String: Any]? {
        var parametersDict : NSDictionary?
        
        switch self {
        case .updateUser(let username, let email, let password, let newpassword, let avatar):
            let mutableParametersDict = NSMutableDictionary()
            mutableParametersDict.setValue(SWUD.object(forkey: "s_token"), forKey: "s_token")
            if (username != nil) {
                mutableParametersDict.setValue(username, forKey: "username")
            }
            if (email != nil) {
                mutableParametersDict.setValue(email, forKey: "email")
            }
            if (password != nil) {
                mutableParametersDict.setValue(password, forKey: "password")
            }
            if (newpassword != nil) {
                mutableParametersDict.setValue(newpassword, forKey: "newpassword")
            }
            if (avatar != nil) {
                mutableParametersDict.setValue(avatar, forKey: "avatar")
            }
            parametersDict = NSDictionary(dictionary: mutableParametersDict)
        }
        return parametersDict?.getSignDict()
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
