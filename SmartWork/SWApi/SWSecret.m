//
//  SWSecret.m
//  SmartWork
//
//  Created by apple on 2017/7/2.
//  Copyright © 2017年 NicoDeng. All rights reserved.
//

#import "SWSecret.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation SWSecret
    
+ (int)getToInt:(NSString*)strtemp
    
{
    // 计算数据实际字节长度
    NSData* da = [strtemp dataUsingEncoding:NSUTF8StringEncoding];
    return (int)[da length];
}
    
//sha1加密方式
+ (NSString *)getSha1String:(NSString *)srcString
{
    const char *cstr = [srcString cStringUsingEncoding:NSUTF8StringEncoding];
    
    NSUInteger len = [SWSecret getToInt:srcString];
    NSData *data = [NSData dataWithBytes:cstr length:len];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}
    
//32位MD5加密方式
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString
{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    [result appendFormat:@"%02x", digest[i]];
    
    return result;
}


@end
