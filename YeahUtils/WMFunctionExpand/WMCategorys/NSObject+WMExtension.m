//
//  NSObject+WMExtension.m
//  YeahUtils
//
//  Created by WMYeah on 16/6/3.
//  Copyright © 2016年 WMYeah. All rights reserved.
//


#import "NSObject+WMExtension.h"
#import <objc/runtime.h>

@implementation NSObject (ZXExtension)

- (void)initDefaultSpaceVlue
{
    NSMutableDictionary *mudic = [NSMutableDictionary dictionary];
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for(int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [mudic setObject:@"" forKey:propertyName];
    }
}

@end
