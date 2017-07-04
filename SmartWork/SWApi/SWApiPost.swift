//
//  SWApiPost.swift
//  SmartWork
//
//  Created by apple on 2017/7/2.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import Foundation

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
