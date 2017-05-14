//
//  OCModule.m
//  JJMediator
//
//  Created by yejiajun on 2017/5/9.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

#import "OCModule.h"

@implementation OCModule

// 无入参无返回值
- (void)moduleMethod
{
    printf("OCModule-调用无入参无返回值函数\n");
}

// 无入参返回对象类型
- (NSString *)fetchNameFromModuleMethod
{
    printf("OCModule-调用无入参返回对象类型函数：");
    return @"jj";
}

// 有入参无返回值
- (void)moduleMethodWithName:(NSString *)name callback:(void(^)(NSString *name))callback
{
    printf("OCModule-调用有入参无返回值函数：");
    if (callback) {
        callback([NSString stringWithFormat:@"%@%@", name, name]);
    }
}

// 有入参返回基本类型
- (int)fetchNumberFromModuleMethodWithNumber:(int)number
{
    printf("OCModule-调用有入参返回基本类型函数：");
    return number * 10;
}

@end
