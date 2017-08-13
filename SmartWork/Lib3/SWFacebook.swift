//
//  SWFacebook.swift
//  SmartWork
//
//  Created by apple on 2017/8/13.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

typealias SWFBSSOAuthBlock = (_ jsonData: NSDictionary) ->Void

class SWFacebook: NSObject {

    static let shareSingleTon: SWFacebook = {
        let instance = SWFacebook()
        return instance
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Void {
        FBSDKApplicationDelegate .sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func ssoSAuthorizationFinishBlock(finishBlock: @escaping SWQQSSOAuthBlock) -> Void {
        if (FBSDKAccessToken.current() == nil) {
            let login = FBSDKLoginManager()
            login.logIn(withReadPermissions: [], from: nil, handler: { (result, error) in
                if ((error) != nil) {
                    //错误处理
                } else if (result?.isCancelled == true) {
                    //用户取消
                } else {
                    //成功登录
                    let fbToken = FBSDKAccessToken.current()
                    let jsonData = ["status" : 1, "userId" : fbToken?.userID ?? ""] as [String : Any]
                    finishBlock(jsonData as NSDictionary)
                }
            })
        } else {
            //直接拿token做处理
        }
    }
}
