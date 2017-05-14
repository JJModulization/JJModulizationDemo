//
//  SwiftModule.swift
//  JJMediator
//
//  Created by yejiajun on 2017/5/9.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

import UIKit

class SwiftModule: NSObject {

    // 无入参无返回值
    public func moduleMethod() {
        print("SwiftModule-调用无入参无返回值函数")
    }
    
    // 无入参返回对象类型
    public func fetchNameFromModuleMethod() -> String? {
        print("SwiftModule-调用无入参返回对象类型函数", terminator: "：")
        return "jj"
    }
    
    // 有入参无返回值
    public func moduleMethod(withName name: String?, callback: ((String?) -> Void)?) {
        print("SwiftModule-调用有入参无返回值函数", terminator: "：")
        if let callback = callback {
            let resultName = name ?? "nil"
            callback(resultName + resultName)
        }
    }
    
    // 有入参返回基本类型
    public func fetchNumberFromModuleMethod(withNumber number: Int) -> Int {
        print("SwiftModule-调用有入参返回基本类型函数", terminator: "：")
        return number * 10
    }
}
