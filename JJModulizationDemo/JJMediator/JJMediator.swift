//
//  JJMediator.swift
//  JJMediator
//
//  Created by yejiajun on 2017/4/27.
//  Copyright © 2017年 yejiajun. All rights reserved.
//

import UIKit

public class JJMediator: NSObject {
    
    // 单例
    private static let singleInstance = JJMediator()
    
    public class func sharedInstance() -> JJMediator {
        return singleInstance
    }
    
    /// 远程APP调用入口
    /// 格式 - scheme://[target]/[action]?[params]，例子 - scheme://target/action?key=value
    /// 上述URL为固定格式，有定制化需求的话，请修改具体的处理逻辑
    ///
    /// - Parameters:
    ///   - URL: URL
    ///   - completion: block回调
    public func performAction(URL url: URL, completion: (_ result: AnyObject) -> Void) -> AnyObject? {
        // 判断URLScheme和命名空间（项目名称）是否一致
        let scheme = url.scheme!
        guard scheme == fetchNameSpace() else {
            return NSNumber(value: false)
        }
        
        var parameters = Dictionary<String, Any>()
        
        let targetName = url.host
        let actionName = url.lastPathComponent
        let parameterString = url.query
        if let targetName = targetName, let parameterString = parameterString {
            let keyEqualValueArray = parameterString.components(separatedBy: "&")
            for keyEqualValueString in keyEqualValueArray {
                let keyAndValueArray = keyEqualValueString.components(separatedBy: "=")
                if keyAndValueArray.count != 2 {
                    continue
                }
                parameters[keyAndValueArray[0]] = keyAndValueArray[1]
            }
            
            // 远程调用的Action方法，为保证结构统一，parameters参数建议使用字典类型封装
            let result = perform(targetName: targetName, actionName: actionName, parameters: parameters)
            if let result = result{
                completion(result)
            }
        }
        
        return NSNumber(value: true)
    }
    
    /// 本地组件调用入口
    ///
    /// - Parameters:
    ///   - targetName: target名称
    ///   - actionName: action名称
    ///   - parameters: 参数
    ///   - isSwiftClass: target是否是Swift类
    /// - Returns: Optional<AnyObject>对象
    public func perform(targetName: String, actionName: String, parameters: Dictionary<String, Any>?, moduleName: String? = nil) -> AnyObject? {
        // Target名称（类名），Swift类需加上命名空间
        let targetClassString: String
        if let moduleName = moduleName {
            targetClassString = moduleName + "." + "Target_" + targetName
        } else {
            targetClassString = "Target_" + targetName
        }
        // Action名称（方法名）
        let actionString = "Action_" + actionName + (parameters != nil ? ":" : "" )
        
        //        // 根据Target获取Class，返回Optional<NSObject.Type>类型的值
        //        let targetClass = NSClassFromString(targetClassString) as? NSObject.Type
        //        // Class实例化,返回Optional<NSObject>类型的值
        //        let target = targetClass?.init()
        // 根据Target获取Class，返回Optional<AnyClass>类型的值
        let targetClass: AnyClass? = NSClassFromString(targetClassString)
        // Class实例化，返回Optional<AnyObject>类型的值
        let target = targetClass?.alloc()
        // 根据Action获取Selector
        let action = NSSelectorFromString(actionString)
        
        if let target = target {
            // 检查Class实例能否响应Action方法，并执行Selector
            if target.responds(to: action) {
                let object = target.perform(action, with: parameters)
                // 返回Optional<Unmanaged<AnyObject>>对象
                if let object = object {
                    return object.takeUnretainedValue()
                } else {
                    return nil
                }
            } else {
                // 无响应请求时，调用默认notFound方法
                let action = NSSelectorFromString("notFound:")
                if target.responds(to: action) {
                    let object = target.perform(action, with: parameters)
                    if let object = object {
                        return object.takeUnretainedValue()
                    } else {
                        return nil
                    }
                } else {
                    // notFound方法也无响应时，返回nil
                    return nil
                }
            }
        } else {
            // target不存在，返回nil
            return nil
        }
    }
    
    // 获取命名空间
    private func fetchNameSpace() -> String {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        return namespace
    }
}
