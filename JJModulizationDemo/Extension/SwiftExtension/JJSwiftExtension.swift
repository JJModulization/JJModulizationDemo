//
//  JJSwiftExtension.swift
//  JJMediator
//
//  Created by yejiajun on 2017/5/11.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

import Foundation
import JJMediator

// Module名称
let swiftModuleName = "SwiftModule"
// Target名称
let swiftTargetName = "Swift";
// Action名称
let swiftModuleMethodName = "swiftModuleMethod";
let swiftFetchNameFromModuleMethodName = "swiftFetchNameFromModuleMethod";
let swiftModuleMethodWithParametersName = "swiftModuleMethodWithParameters";
let swiftFetchNumberFromModuleMethodWithParametersName = "swiftFetchNumberFromModuleMethodWithParameters";

extension JJMediator {

    // 无入参无返回值
    public func JJMediator_swiftModuleMethod() {
        _ = self.perform(targetName: swiftTargetName, actionName: swiftModuleMethodName, parameters: nil, moduleName: swiftModuleName)
    }
    
    // 无入参返回对象类型
    public func JJMediator_swiftFetchNameFromModuleMethod() -> String? {
        return self.perform(targetName: swiftTargetName, actionName: swiftFetchNameFromModuleMethodName, parameters: nil, moduleName: swiftModuleName) as? String
    }
    
    // 有入参无返回值
    public func JJMediator_swiftModuleMethod(withName name: String?, callback: ((String?) -> Void)?) {
        var parameters = Dictionary<String, Any>()
        parameters["name"] = name
        parameters["callback"] = callback
        _ = self.perform(targetName: swiftTargetName, actionName: swiftModuleMethodWithParametersName, parameters: parameters, moduleName: swiftModuleName)
    }
    
    // 有入参返回基本类型
    public func JJMediator_swiftFetchNumberFromModuleMethod(withNumber number: Int) -> Int {
        var parameters = Dictionary<String, Any>()
        parameters["number"] = number
        let result = self.perform(targetName: swiftTargetName, actionName: swiftFetchNumberFromModuleMethodWithParametersName, parameters: parameters, moduleName: swiftModuleName) as? NSNumber
        if let result = result {
            return result.intValue
        } else {
            return 0
        }
    }
}
