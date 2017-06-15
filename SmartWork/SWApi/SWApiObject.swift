//
//  SWApiObject.swift
//  SmartWork
//
//  Created by apple on 2017/6/11.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import UIKit

class SWValid: NSObject {
    
    class func email(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    class func smsvcode(_ sms: String) -> Bool {
        let smsWordRegex = "^[0-9]{6}"
        let smsWordPredicate = NSPredicate(format: "SELF MATCHES %@", smsWordRegex)
        return smsWordPredicate.evaluate(with: smsWordPredicate)
    }
    
    class func mobile(_ mobile: String) ->Bool  {
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9])|(14[7]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneTest)
    }
}

class SWUD: NSObject {
    
    class func removeObject(forKey defaultName: String) {
        let def = UserDefaults.standard
        def.removeObject(forKey: defaultName)
        def.synchronize()
    }
    
    class func set(BoolValue: Bool, forkey defaultName: String) {
        let def = UserDefaults.standard
        def.set(BoolValue, forKey: defaultName)
        def.synchronize()
    }

    class func set(IntValue: Int, forkey defaultName: String) {
        let def = UserDefaults.standard
        def.set(IntValue, forKey: defaultName)
        def.synchronize()
    }
    
    class func set(FloatValue: Float, forkey defaultName: String) {
        let def = UserDefaults.standard
        def.set(FloatValue, forKey: defaultName)
        def.synchronize()
    }
    
    class func set(DoubleValue: Double, forkey defaultName: String) {
        let def = UserDefaults.standard
        def.set(DoubleValue, forKey: defaultName)
        def.synchronize()
    }
    
    class func set(URLValue: URL?, forkey defaultName: String) {
        let def = UserDefaults.standard
        def.set(URLValue, forKey: defaultName)
        def.synchronize()
    }
    
    class func set(AnyValue: Any?, forkey defaultName: String) {
        let def = UserDefaults.standard
        def.set(AnyValue, forKey: defaultName)
        def.synchronize()
    }
    
    class func object(forkey defalutName: String) -> Any? {
        let def = UserDefaults.standard
        return def.object(forKey: defalutName)
    }
}
