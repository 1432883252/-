//
//  NSObject+Encoding.m
//
//  Created by wangpanpan on 14-8-24.
//  Copyright (c) 2014年wangpanpan. All rights reserved.
//

#import "NSObject+Encoding.h"

@implementation NSObject (Encoding)


-(NSString *)encodingCollectionObject
{
    NSString *tempStr1 = [[self description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    //NSLog(@"encoding result:%@",str);
    
    
    return str;
}

@end
