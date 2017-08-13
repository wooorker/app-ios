//
//  SWQQ.swift
//  SmartWork
//
//  Created by apple on 2017/8/13.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

private let kQQAppKey = "1106320452"

typealias SWQQSSOAuthBlock = (_ jsonData:NSDictionary) ->Void

class SWQQ: NSObject, TencentSessionDelegate {

    var auth_callback: SWQQSSOAuthBlock?
    var tencentOAuth: TencentOAuth?
    var permission: NSArray? = nil
    var uid: NSString?
    
    static let shareSingleTon: SWQQ = {
        let instance = SWQQ()
        instance.initTencent(delegate: instance)
        return instance
    }()
    
    private func initTencent(delegate: AnyObject) -> Void {
        self.tencentOAuth = TencentOAuth.init(appId: kQQAppKey, andDelegate: self)
        
    }
    
    func ssoSAuthorizationFinishBlock(finishBlock: @escaping SWQQSSOAuthBlock) -> Void {
        self.auth_callback = finishBlock;
        
    }
    
    func login() -> Void {
        self.permission = NSArray.init(objects: kOPEN_PERMISSION_GET_SIMPLE_USER_INFO)
        self.tencentOAuth?.authorize(self.permission as! [Any], inSafari: false)
    }
    
    func  logout() -> Void {
        self.tencentOAuth?.logout(self)
    }
    
    func tencentDidNotNetWork() -> Void {
        
    }
    
    func tencentDidLogin() -> Void {
        
    }
    
    func tencentDidNotLogin(_ cancelled: Bool) -> Void {
        
    }

}
