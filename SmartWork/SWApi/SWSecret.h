//
//  SWSecret.h
//  SmartWork
//
//  Created by apple on 2017/7/2.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWSecret : NSObject
+ (NSString *)getSha1String:(NSString *)srcString;
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString;

@end

