//
//  SwiftPCH.swift
//  SmartWork
//
//  Created by apple on 2017/5/30.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

func RGBAColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
		
