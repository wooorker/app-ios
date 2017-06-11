//
//  SWApiObject.swift
//  SmartWork
//
//  Created by apple on 2017/6/11.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

class SWValid: NSObject {
    
    class func email(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    class func smsvcode(sms: String) -> Bool {
        let smsWordRegex = "^[0-9]{6}"
        let smsWordPredicate = NSPredicate(format: "SELF MATCHES %@", smsWordRegex)
        return smsWordPredicate.evaluate(with: smsWordPredicate)
    }
    
    class func mobile(mobile: String) ->Bool  {
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9])|(14[7]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneTest)
    }
}
