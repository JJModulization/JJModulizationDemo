//
//  Target_Swfit.swift
//  JJMediator
//
//  Created by yejiajun on 2017/5/9.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

import UIKit

class Target_Swift: NSObject {
    
    // 无入参无返回值
    public func Action_swiftModuleMethod() {
        let swiftModule = SwiftModule()
        swiftModule.moduleMethod()
    }
    
    // 无入参返回对象类型
    public func Action_swiftFetchNameFromModuleMethod() -> String? {
        let swiftModule = SwiftModule()
        let name = swiftModule.fetchNameFromModuleMethod()
        return name
    }
    
    // 有入参无返回值
    public func Action_swiftModuleMethod(parameters: Dictionary<String, Any>) {
        let swiftModule = SwiftModule()
        let name = parameters["name"] as? String
        let callback = parameters["callback"] as? (String?) -> Void
        swiftModule.moduleMethod(withName: name, callback: callback)
    }
    
    // 有入参返回基本类型
    public func Action_swiftFetchNumberFromModuleMethod(parameters: Dictionary<String, Any>) -> NSNumber {
        let swiftModule = SwiftModule()
        let number = parameters["number"] as! Int
        let result = swiftModule.fetchNumberFromModuleMethod(withNumber: number)
        let resultNumber = NSNumber(value: result)
        return resultNumber
    }
}

