//
//  SwiftPCH.swift
//  SmartWork
//
//  Created by apple on 2017/5/30.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import Foundation
import UIKit

let app_key = "c495b324e43b105537a9e0cd3b84a9d4"
let app_secret = "f3aa76a1a6fd379b6e19d2c37512526b"

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

func RGBAColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

//用于签名
extension NSDictionary {
    func getSignDict() -> [String: Any]? {
        let mutDict = NSMutableDictionary.init(dictionary: self)
        
        var baseString = ""
        
        let timestampString = String(Int(NSDate().timeIntervalSince1970) * 1000)
        mutDict.setValue(app_key, forKey: "app_key")
        mutDict.setValue(timestampString, forKey: "timestamp")
        mutDict.setValue("ddf", forKey: "did")
        
        let allKeys = mutDict.allKeys.sorted { (obj1, obj2) -> Bool in
            if obj1 as!String > obj2 as!String {
                return false
            } else {
                return true
            }
        }
        
        for key  in allKeys {
            let value = mutDict.object(forKey: key) as! String
            baseString = baseString.appending(value)
        }
        
        baseString = baseString.appending(app_secret)
        baseString = SWSecret.getSha1String(baseString)
        baseString = SWSecret.getMd5_32Bit_String(baseString)
        mutDict.setValue(baseString, forKey: "sign")
        let dict = NSDictionary(dictionary: mutDict)
        return dict as? [String : Any]
    }
}

