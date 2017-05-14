//
//  JJOCExtension.swift
//  JJMediator
//
//  Created by yejiajun on 2017/5/11.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

import Foundation
import JJMediator

/*
 * Swift闭包想要通过字典或数组传值给Objective-C函数调用的步骤：
 * 1.声明闭包时，添加关键词@convention(block)修饰;
 * 2.用unsafeBitCast函数将Swift闭包转为Objective-C的兼容的对象
 */

// Target名称
let ocTargetName = "OC";
// Action名称
let ocModuleMethodName = "ocModuleMethod";
let ocFetchNameFromModuleMethodName = "ocFetchNameFromModuleMethod";
let ocModuleMethodWithParametersName = "ocModuleMethodWithParameters";
let ocFetchNumberFromModuleMethodWithParametersName = "ocFetchNumberFromModuleMethodWithParameters";

extension JJMediator {
    
    // 无入参无返回值
    public func JJMediator_ocModuleMethod() {
        _ = self.perform(targetName: ocTargetName, actionName: ocModuleMethodName, parameters: nil)
    }
    
    // 无入参返回对象类型
    public func JJMediator_ocFetchNameFromModuleMethod() -> String? {
        return self.perform(targetName: ocTargetName, actionName: ocFetchNameFromModuleMethodName, parameters: nil) as? String
    }
    
    // 有入参无返回值
    public func JJMediator_ocModuleMethod(withName name: String?, callback: (@convention(block) (String?) -> Void)?) {
        var parameters = Dictionary<String, Any>()
        parameters["name"] = name
        let callbackObject = unsafeBitCast(callback, to: AnyObject?.self)
        parameters["callback"] = callbackObject
        _ = self.perform(targetName: ocTargetName, actionName: ocModuleMethodWithParametersName, parameters: parameters)
    }
    
    // 有入参返回基本类型
    public func JJMediator_ocFetchNumberFromModuleMethod(withNumber number: Int) -> Int {
        var parameters = Dictionary<String, Any>()
        parameters["number"] = number
        return self.perform(targetName: ocTargetName, actionName: ocFetchNumberFromModuleMethodWithParametersName, parameters: parameters) as! Int
    }
    
}
