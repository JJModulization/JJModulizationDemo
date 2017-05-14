//
//  Target_OC.h
//  JJMediator
//
//  Created by yejiajun on 2017/5/9.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 1.若Module中的方法返回值为基本类型，在Target_Action中需转为对象类型返回（如int->NSNumber）
 2.若Module中的方法有入参，在Target_Action中需封装成字典类型（如NSDictionary
 3.若Module中的方法没有返回值，在Target_Action中需返回id类型对象，在实现方法中return nil
 */
@interface Target_OC : NSObject

// 无入参无返回值
- (id)Action_ocModuleMethod;
// 无入参返回对象类型
- (NSString *)Action_ocFetchNameFromModuleMethod;
// 有入参无返回值
- (id)Action_ocModuleMethodWithParameters:(NSDictionary *)parameters;
// 有入参返回基本类型
- (NSNumber *)Action_ocFetchNumberFromModuleMethodWithParameters:(NSDictionary *)parameters;

@end
