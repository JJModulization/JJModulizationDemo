//
//  OCModule.h
//  JJMediator
//
//  Created by yejiajun on 2017/5/9.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCModule : NSObject

// 无入参无返回值
- (void)moduleMethod;
// 无入参返回对象类型
- (NSString *)fetchNameFromModuleMethod;
// 有入参无返回值
- (void)moduleMethodWithName:(NSString *)name callback:(void(^)(NSString *name))callback;
// 有入参返回基本类型
- (int)fetchNumberFromModuleMethodWithNumber:(int)number;

@end
