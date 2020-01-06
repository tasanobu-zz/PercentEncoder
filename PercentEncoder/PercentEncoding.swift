//
//  PercentEncoding.swift
//  PercentEncoder
//
//  Created by Kazunobu Tasaka on 8/4/15.
//  Copyright (c) 2015 Kazunobu Tasaka. All rights reserved.
//

import Foundation
import JavaScriptCore

public enum PercentEncoding: String {
    case encodeURI, encodeURIComponent, decodeURI, decodeURIComponent
    
    public func evaluate(string: String) -> String {
        guard let context = JSContext() else {
            return ""
        }
        let inputValue = JSValue(object: string, in: context)
        context.setObject(inputValue, forKeyedSubscript: "input" as NSString)
        context.evaluateScript("var output = \(rawValue)(input);")
        let outputValue: JSValue = context.objectForKeyedSubscript("output")
        return outputValue.toString()
    }
}
