//
//  SWWeixin.swift
//  SmartWork
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

private let WXAppKey = "wxb0a017d7aeb37b82"
private let WXAppSecret = ""
typealias SWWeiXinSSOAuthBlock = (_ jsonData:NSDictionary) ->Void

class SWWeixin: NSObject, WXApiDelegate {
    
    var auth_callback: SWWeiXinSSOAuthBlock?
    
    
    static let shareSingleTon:SWWeixin = {
        WXApi.registerApp(WXAppKey)
        let instance = SWWeixin()
        return instance
    }()
    
    func isWXAppInstalled() -> Bool {
        return WXApi.isWXAppInstalled()
    }
    
    func ssoAuthorizationFinishBlock(finishBlock: @escaping SWWeiXinSSOAuthBlock) ->Void {
        let req = SendAuthReq()
        req.scope = "snsapi_userinfo"
        req.state = "123"
        
        self.auth_callback = finishBlock
        WXApi.send(req)
    }
    
    /*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
     *
     * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
     * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
     * @param req 具体请求内容，是自动释放的
     */
    func onReq(_ req: BaseReq!) {
        
    }
    
    func onResp(_ resp: BaseResp!) {
        if (resp.isKind(of: SendAuthResp.self)) {
            if ((self.auth_callback) != nil) {
                switch resp.errCode {
                case 0:
                    let authResp: SendAuthResp = resp as! SendAuthResp
                    print("code:%@    state:%@", authResp.code, authResp.state)
                    
                
                    return;
                default:
                    return;
                }
            }
        }
    }
    
    
}
